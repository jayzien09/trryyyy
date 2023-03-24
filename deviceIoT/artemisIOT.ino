#if defined(ESP32)
#include <WiFi.h>
#elif defined(ESP8266)
#include <ESP8266WiFi.h>
#endif

//Firebase Setup
#include <Firebase_ESP_Client.h>
#include "time.h"
#include "addons/TokenHelper.h"
#include "addons/RTDBHelper.h"

//Air Quality Setup
#include <SoftwareSerial.h>

//Accelerometer Setup
#include <Adafruit_MPU6050.h>
#include <Adafruit_Sensor.h>
#include <Wire.h>

//========================================================================================================//
//WiFi Connectivity
#define WIFI_NETWORK "XPN-4014A7"
#define WIFI_PASSWORD "NCTV082222"
#define WIFI_TIMEOUT_MS 20000

//========================================================================================================//
//Firebase
#define API_KEY "AIzaSyAf2_XQu9AfUbeF7JnmNQL_kaeURsXZycY"

// Insert Authorized Email and Corresponding Password
#define USER_EMAIL "basilaeadrian@gmail.com"
#define USER_PASSWORD "artemis"

// Insert RTDB URLefine the RTDB URL
#define DATABASE_URL "https://artemisiot-b401b-default-rtdb.asia-southeast1.firebasedatabase.app/"

//========================================================================================================//
// Define Firebase objects
FirebaseData fbdo;
FirebaseAuth auth;
FirebaseConfig config;

// Variable to save USER UID
String uid;

// Database main path (to be updated in setup with the user UID)
String databasePath;

// Database child nodes
String luxPath = "/ambientLight";
String tempPath = "/ambientTemperature";
String humPath = "/ambientHumidity";
String fmhdPath = "/ambientFMHD";
String decbPath = "/ambientSound";
String partsPath = "/ambientParticulates";
String timePath = "/timestamp";

// Parent Node (to be updated in every loop)
String parentPath;
FirebaseJson json;

//========================================================================================================//
//Air Quality Sensor (PM 2.5)

//SoftwareSerial Serial1(, ); // Software RX, TX Switch this when connecting to ESP32 - Sensor Tx pin to ESP32 Rx pin and vice versa (INSERT PINS!!!!!)
char col;
int samplingRate = 10;
unsigned int PMSa = 0, FMHDSa = 0, TPSa = 0, HDSa = 0, PMSb = 0, FMHDSb = 0, TPSb = 0, HDSb = 0;
unsigned int FMHDS = 0, TPS = 0, HDS = 0, CR1 = 0, CR2 = 0;
volatile unsigned int PMS = 0;
unsigned char buffer_RTT[40] = {};   //Serial buffer; Received Data
char tempStr[15];
char hmdStr[15];

//Analog Sensors, Lux and dB
unsigned int ambientLight = 0; ambientSound= 0; 

//========================================================================================================//

// Time Configuration
int timestamp;
const char* ntpServer = "pool.ntp.org";
// Timer variables (send new readings every three minutes)
unsigned long sendDataPrevMillis = 0;
unsigned long timerDelay = 180000;

Adafruit_MPU6050 mpu;

void startLED() {
  digitalWrite(LED_BUILTIN, HIGH);
  delay(350);
  digitalWrite(LED_BUILTIN, LOW);
  delay(350);
}

unsigned long getTime() {
  time_t now;
  struct tm timeinfo;
  if (!getLocalTime(&timeinfo)) {
    //Serial.println("Failed to obtain time");
    return(0);
  }
  time(&now);
  return now;
}

void connectToWiFi(){
  Serial.print("= Connecting to Wifi =");
  WiFi.mode(WIFI_STA);
  WiFi.begin(WIFI_NETWORK, WIFI_PASSWORD);

  unsigned long startConnectionAttempt = millis();
  while(WiFi.status() != WL_CONNECTED && millis() - startConnectionAttempt < WIFI_TIMEOUT_MS){
    Serial.println("Trying to connect...");
    delay(100);
  }

  if(WiFi.status() != WL_CONNECTED){
    Serial.println("WiFi Connection Failed!");
    while(true){
      digitalWrite(LED_BUILTIN, HIGH);
      delay(50);
      digitalWrite(LED_BUILTIN, LOW);
      delay(50);
    }
  }else{
    Serial.print("WiFi Connection Established: ");
    Serial.println(WiFi.localIP());
  }
}

void checkAirQuality(){

  while (!Serial1.available());
  while (Serial1.available() > 0)     //Data check: weather there is any Data in Serial1
  {
    for (int i = 0; i < 40; i++)
    {
      col = Serial1.read();
      buffer_RTT[i] = (char)col;
      delay(2);
    }

    Serial1.flush();

    CR1 = (buffer_RTT[38] << 8) + buffer_RTT[39];
    CR2 = 0;
    for (int i = 0; i < 38; i++)
      CR2 += buffer_RTT[i];
    if (CR1 == CR2){
      PMSa = buffer_RTT[12];          //Read PM2.5 High 8-bit
      PMSb = buffer_RTT[13];          //Read PM2.5 Low 8-bit
      PMS = (PMSa << 8) + PMSb;       //**PM2.5 value
      FMHDSa = buffer_RTT[28];        //Read Formaldehyde High 8-bit
      FMHDSb = buffer_RTT[29];        //Read Formaldehyde Low 8-bit
      FMHDS = (FMHDSa << 8) + FMHDSb; //**Formaldehyde value
      TPSa = buffer_RTT[30];          //Read Temperature High 8-bit
      TPSb = buffer_RTT[31];          //Read Temperature Low 8-bit
      TPS = (TPSa << 8) + TPSb;       //**Temperature value
      HDSa = buffer_RTT[32];          //Read Humidity High 8-bit
      HDSb = buffer_RTT[33];          //Read Humidity Low 8-bit
      HDS = (HDSa << 8) + HDSb;       //**Humidity value
    }
    else{
      PMS = 0;
      FMHDS = 0;
      TPS = 0;
      HDS = 0;
    }
  }

  Serial.println("-----------------------uart--------------------------");
  Serial.print("Temp : ");
  sprintf(tempStr, "%d%d.%d", TPS / 100, (TPS / 10) % 10, TPS % 10);
  Serial.print(tempStr);
  Serial.println(" C");              //Serial pring Temperature
  Serial.print("RH   : ");
  sprintf(hmdStr, "%d%d.%d", HDS / 100, (HDS / 10) % 10, HDS % 10);
  Serial.print(hmdStr);          //Serial print humidity
  Serial.println(" %");
  Serial.print("HCHO : ");
  Serial.print(FMHDS);
  Serial.println(" ug/m3");       //Serial print formaldehyde, unit: ug/m³
  Serial.print("PM2.5: ");
  Serial.print(PMS);
  Serial.println(" ug/m3");       //Serial print PM2.5, unit: ug/m³
  Serial.println();

}

void checkLight(){
  //get ambient light
  //sampling 
  int i = 0;
  for (i; i < samplingRate; i++) { 
    //analogRead();
  }
}

void checkSound(){
  //get ambient sound
  //sampling
  int i = 0;
  for (i; i < samplingRate; i++) { 
    //analogRead();
  }
}

void setup() {
  Serial.begin(115200);
  Serial1.begin(115200); //PM2.5 Sensor Serial start
  pinMode(LED_BUILTIN, OUTPUT);
  
  connectToWiFi();
  configTime(0, 0, ntpServer);

  //Firebase Connect
  // Assign the api key (required)
  config.api_key = API_KEY;

  // Assign the user sign in credentials
  auth.user.email = USER_EMAIL;
  auth.user.password = USER_PASSWORD;

  // Assign the RTDB URL (required)
  config.database_url = DATABASE_URL;

  Firebase.reconnectWiFi(true);
  fbdo.setResponseSize(4096);

  // Assign the callback function for the long running token generation task */
  config.token_status_callback = tokenStatusCallback; //see addons/TokenHelper.h

  // Assign the maximum retry of token generation
  config.max_token_generation_retry = 5;

  // Initialize the library with the Firebase authen and config
  Firebase.begin(&config, &auth);
  // Getting the user UID might take a few seconds
  Serial.println("Getting User UID");
  while ((auth.token.uid) == "") {
    Serial.print('.');
    delay(1000);
  }
  // Print user UID
  uid = auth.token.uid.c_str();
  Serial.print("User UID: ");
  Serial.println(uid);

  // Update database path
  databasePath = "/UsersData/" + uid + "/readings";

  //Accelerometer Setup
   if (!mpu.begin()) {
    Serial.println("Failed to find MPU6050 chip");
    while (1) {
      delay(10);
    }
  }
  Serial.println("MPU6050 Found!");

  //setup motion detection
  mpu.setHighPassFilter(MPU6050_HIGHPASS_0_63_HZ);
  mpu.setMotionDetectionThreshold(1);
  mpu.setMotionDetectionDuration(20);
  mpu.setInterruptPinLatch(true);	// Keep it latched.  Will turn off when reinitialized.
  mpu.setInterruptPinPolarity(true);
  mpu.setMotionInterrupt(true);

  Serial.println("");
  delay(100);

}

void loop() {

  if(mpu.getMotionInterruptStatus()) {
    /* Get new sensor events with the readings */
    sensors_event_t a, g, temp;
    mpu.getEvent(&a, &g, &temp);
    // SET motion state to true
    // Recede all sensing function
  }

  if (Firebase.ready() && (millis() - sendDataPrevMillis > timerDelay || sendDataPrevMillis == 0)){
    startLED();
    sendDataPrevMillis = millis();
    
    //Get current timestamp
    timestamp = getTime();
    Serial.print ("time: ");
    Serial.println (timestamp);

    //Get air quality
    checkAirQuality();
    check


    //Prepare Sensor Log
    parentPath= databasePath + "/" + String(timestamp);
    json.set(tempPath.c_str(), String("0"));
    json.set(luxPath.c_str(), String("0"));
    json.set(decbPath.c_str(), String("0"));
    json.set(partsPath.c_str(), String("0"));
    json.set(humPath.c_str(), String("0"));
    json.set(fmhdPath.c_str(), String("0"));
    json.set(timePath, String(timestamp));
    //json.set(tempPath.c_str(), String(bme.readTemperature()));
    //json.set(humPath.c_str(), String(bme.readHumidity()));
    //json.set(presPath.c_str(), String(bme.readPressure()/100.0F));

    Serial.printf("Set json... %s\n", Firebase.RTDB.setJSON(&fbdo, parentPath.c_str(), &json) ? "ok" : fbdo.errorReason().c_str());
    startLED();
  }
}
