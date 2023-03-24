#if defined(ESP32)
#include <WiFi.h>
#elif defined(ESP8266)
#include <ESP8266WiFi.h>
#endif

//Deep Sleep Timer
#define DEEP_SLEEP_TIME 50 //50minutes
//RTC_DATA_ATTR //use this to save data even when asleep

//Firebase Setup
#include <Firebase_ESP_Client.h>
#include "time.h"
#include "addons/TokenHelper.h"
#include "addons/RTDBHelper.h"

//Accelerometer Setup
#include <Adafruit_MPU6050.h>
#include <Adafruit_Sensor.h>
#include <Wire.h>

//CO2 PWM Setup
#include <Arduino.h>
#include <FunctionalInterrupt.h>
#define  sensorIn  39   // Sensor PWM interface
#define  interruptNumber  39   // interrupt number

unsigned long pwm_high_start_ticks=0, pwm_high_end_ticks=0;
float pwm_high_val=0, pwm_low_val=0;
volatile uint8_t flag=0;

//DHT11 Humidity Setup
#include "DHT.h"
#define DHT11PIN 33
DHT dht(DHT11PIN, DHT11);

Adafruit_MPU6050 mpu;
//========================================================================================================//
//WiFi Connectivity
#define WIFI_NETWORK "XPN-4014A7"
#define WIFI_PASSWORD "NCTV082222"
// #define WIFI_NETWORK "Mi 10T Pro"
// #define WIFI_PASSWORD "onetwothreefour"
#define WIFI_TIMEOUT_MS 20000

//========================================================================================================//
//Firebase
#define API_KEY "AIzaSyCTBE1WUJAizHLvnd3Wl_LdA8hbh4OiFQ0"

// Insert Authorized Email and Corresponding Password
#define USER_EMAIL "artemis.esg2022@gmail.com"
#define USER_PASSWORD "@rtemisESG2022"
#define PROJECT_ID "artemis-f2a4c"
// Insert RTDB URLefine the RTDB URL
#define DATABASE_URL "https://artemis-f2a4c-default-rtdb.asia-southeast1.firebasedatabase.app/"

//========================================================================================================//
// Define Firebase objects
FirebaseData fbdo;
FirebaseAuth auth;
FirebaseConfig config;

String uid; // Variable to save USER UID
String databasePath; // Database main path (to be updated in setup with the user UID)

// Database child nodes
String luxPath    = "/ambientLight";
String tempPath   = "/ambientTemperature";
String humPath    = "/ambientHumidity";
String fmhdPath   = "/ambientFMHD";
String decbPath   = "/ambientSound";
String co2Path    = "/ambientCarbonDioxide";
String partsPath  = "/ambientParticulates";
String timePath   = "/timestamp";
String motionPath = "/motion";

// Parent Node (to be updated in every loop)
String parentPath;
FirebaseJson json;

//========================================================================================================//
// Time Configuration
int timestamp;
const char* ntpServer = "pool.ntp.org";

// Timer variables (send new readings every three minutes)
unsigned long sendDataPrevMillis = 0;
//unsigned long timerDelay = 180000; //every 3mins
unsigned long timerDelay = 3600000; //every 1HR

//Analog Sensors Setup
int soundPin = 34;
int lightPin = 35;
//int co2Pin = 39;
int samplingRate = 10;

float ambientCO2Reading = 0.0; 
unsigned int preheatCounter = 0;
unsigned int ambientLightReading = 0;
unsigned int ambientSoundReading = 0;
float ambientHumidityReading = 0.0;
float ambientTemperatureReading = 0.0;
int lightScore = 0;
bool motionActive = false;

//========================================================================================================//
//PWM Interrupts
void interrupt_rising()
{
  pwm_high_start_ticks = micros();    // store the current micros() value
  if(2 == flag){
    flag = 4;
    pwm_low_val = pwm_high_start_ticks - pwm_high_end_ticks;
  }else{
    flag = 1;
  }
  attachInterrupt(interruptNumber, interrupt_falling, FALLING);
}

void interrupt_falling()
{
  pwm_high_end_ticks = micros();    // store the current micros() value
  if(1 == flag){
    flag = 2;
    pwm_high_val = pwm_high_end_ticks - pwm_high_start_ticks;
  }
  attachInterrupt(interruptNumber, interrupt_rising, RISING);
}

//========================================================================================================//

void startLED() {
  digitalWrite(LED_BUILTIN, HIGH);
  delay(350);
  digitalWrite(LED_BUILTIN, LOW);
  delay(350);
  digitalWrite(LED_BUILTIN, HIGH);
  delay(350);
  digitalWrite(LED_BUILTIN, LOW);
  delay(350);
}

void senseLED() {
  digitalWrite(LED_BUILTIN, HIGH);
  delay(100);
  digitalWrite(LED_BUILTIN, LOW);
  delay(100);
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

void enterDeepSleep(){
  Serial.println(" = Entering Deep Sleep Mode = ");
  esp_sleep_enable_timer_wakeup(DEEP_SLEEP_TIME * 60000);
  esp_deep_sleep_start();
}

void connectToWiFi(){
  Serial.println("= Connecting to Wifi =");
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



void connectToFirebase(){
  delay(100);
  Serial.println("= Setting-up Cloud DB =");
  //Firebase Connect
  config.api_key = API_KEY;               // Assign the api key (required)
  auth.user.email = USER_EMAIL;           // Assign the user sign in credentials
  auth.user.password = USER_PASSWORD;
  //config.database_url = DATABASE_URL;     // Assign the RTDB URL (required)
  Firebase.reconnectWiFi(true);
  fbdo.setResponseSize(4096);
  config.token_status_callback = tokenStatusCallback; 
  config.max_token_generation_retry = 5;  // Assign the maximum retry of token generation
  
  Serial.println("= Establishing Connection to Cloud DB =");
  Firebase.begin(&config, &auth);         // Initialize the library with the Firebase authen and config

  Serial.println("Getting User UID");     // Getting the user UID might take a few seconds
  while ((auth.token.uid) == "") {
    Serial.print('.');
    delay(1000);
  }

  uid = auth.token.uid.c_str();   
  Serial.println("= Artemis.esg IoT Edge Device Registered! =");        // Print user UID
  Serial.print("User UID: ");
  Serial.println(uid);
  //databasePath = "UsersData/" + uid + "/readings"; // Update database path
  databasePath = "UsersData/" + uid + "/"; // Update database path
  databasePath = "UsersData/" + uid; // Update database path
}

void readSound(){
  Serial.println("Checking Ambient Sound");
  delay(100);
  unsigned int ambientSound = 0;
  unsigned int soundSum = 0;
  int i = 0;
  for (i; i < samplingRate; i++) { 
    int soundDB = analogRead(soundPin);
    soundSum += soundDB;
    Serial.print("Sound Value: ");
    Serial.println(soundDB);
    delay(100);
  }
  ambientSound = (soundSum/samplingRate);
  ambientSoundReading = ambientSound;
  Serial.println("");
  Serial.print("Ambient Sound: ");
  Serial.println(ambientSound);
}

void readLight(){
  Serial.println("Checking Ambient Light");
  delay(100);
  unsigned int ambientLight = 0;
  unsigned int lightSum = 0;
  int i = 0;
  for (i; i < samplingRate; i++) { 
    int lightLux = analogRead(lightPin);
    lightSum += lightLux;
    Serial.print("Light Value: ");
    Serial.println(lightLux);
    delay(100);
  }
  ambientLight = (lightSum/samplingRate);
  ambientLightReading = ambientLight;
  Serial.println("");
  Serial.print("Ambient Light: ");
  Serial.println(ambientLight);
}

void readTemperature(){
  Serial.println("Checking Ambient Temperature");
  delay(100);
  sensors_event_t a, g, temp;
  mpu.getEvent(&a, &g, &temp);
  Serial.println("");
  ambientTemperatureReading = temp.temperature;
  Serial.print("Ambient Temperature: ");
  Serial.print(temp.temperature);
  Serial.println(" degC");
}

void readHumidity(){
  Serial.println("Checking Ambient Humidity");
  delay(100);
  float ambientHumidity = 0;
  float humiditySum = 0;
  int i = 0;
  for (i; i < samplingRate; i++) { 
    float humidity = dht.readHumidity();
    humiditySum += humidity;
    Serial.print("Humidity Value: ");
    Serial.println(humidity);
    delay(100);
  }
  ambientHumidity = (humiditySum/samplingRate);  
  ambientHumidityReading = ambientHumidity;
  Serial.println("");
  Serial.print("Ambient Humidity: ");
  Serial.println(ambientHumidityReading);
}

void activateMotion(){
  Serial.println("= Initializing Motion Sensor =");
  delay(10000);
  if (!mpu.begin()) {
    Serial.println("Failed to initialize Motion chip");
    while (1) {
      delay(10);
    }
  }
  mpu.setHighPassFilter(MPU6050_HIGHPASS_0_63_HZ);
  mpu.setMotionDetectionThreshold(1);
  mpu.setMotionDetectionDuration(20);
  mpu.setInterruptPinLatch(true);	// Keep it latched.  Will turn off when reinitialized.
  mpu.setInterruptPinPolarity(true);
  mpu.setMotionInterrupt(true);
  Serial.println("");
  delay(100);

  Serial.println("Motion Sensing Active!");
}

void readCarbonDioxide(){
  Serial.println("Checking Ambient Carbon Dioxide");
  attachInterrupt(interruptNumber, interrupt_rising, RISING);
  Serial.println("= CO2 Sensor PWM Monitoring Attached =");   
  float sumCO2 = 0.0;
  int samplingRate = 10;
  int counter = 0;
  while(counter < samplingRate){
    float valCO2 = recordCO2();
    if (valCO2 > 0){
      sumCO2 += valCO2;
      counter += 1;
      Serial.print("Sampling Count: ");
      Serial.println(counter);   
      senseLED();   
    }
    delay(100); 
  }
  float readingCO2 = sumCO2/samplingRate;
  ambientCO2Reading = readingCO2;
  Serial.print("Carbon Dioxide Concentration: ");
  Serial.println(ambientCO2Reading);   
  delay(1000);  
  Serial.println("= CO2 Monitoring Halted =");   
  detachInterrupt(interruptNumber);
  //return readingCO2;
}

float recordCO2(){
  float CO2 = 0.0;
  while(CO2 <= 0.0){
    if(flag == 4){
      flag = 1;
      float pwm_high_val_ms = (pwm_high_val * 1000) / (pwm_low_val + pwm_high_val);
      if (pwm_high_val_ms < 0.01){
        Serial.println("= Warning! Sensor Fault Detected! =");
      }
      else if (pwm_high_val_ms < 80.00){
        Serial.println("= Sensor is Pre-heating! Please Wait = ");
      }
      else if (pwm_high_val_ms < 998.00){
        float concentration = (pwm_high_val_ms - 2) * 5;
        CO2 = concentration;
        // Print pwm_high_val_ms
        Serial.print("pwm_high_val_ms:");
        Serial.print(pwm_high_val_ms);
        Serial.println("ms");
        //Print CO2 concentration
        Serial.print("CO2 Concentration: ");
        Serial.print(concentration);
        Serial.println("ppm");
      }else{
        Serial.println("Beyond the maximum range ：398~4980ppm");
      }
      Serial.println();
    }
  }
  return CO2;
}

void setup() {
  Serial.println("= Setting up IoT Edge Device =");
  Serial.begin(115200);
  pinMode(LED_BUILTIN, OUTPUT);
  digitalWrite(LED_BUILTIN,LOW);
  connectToWiFi();                        //Connect ESP32 to WiFi
  configTime(0, 0, ntpServer);            //Configure Time Server
  connectToFirebase();                    //Connect ESP32 to Firebase RTDB
  pinMode(sensorIn, INPUT);               //CO2 sensor init
  dht.begin();                            //Begin Humidity sensor
  activateMotion();                       //Activate Device Tampering detection
  Serial.println();
}

void loop() {
  if(mpu.getMotionInterruptStatus()) {
    /* Get new sensor events with the readings */
    delay(100);
    sensors_event_t a, g, temp;
    mpu.getEvent(&a, &g, &temp);
    startLED();
    Serial.println("Motion Detected!");
    motionActive = true;
    Serial.println("");
  }

  if (Firebase.ready() && (millis() - sendDataPrevMillis > timerDelay || sendDataPrevMillis == 0)){
    startLED();
    Serial.println("");
    Serial.println("");
    Serial.println("= Environment Sensing Started =");
    sendDataPrevMillis = millis();
    timestamp = getTime();//Get current timestamp
    Serial.print ("Time Now: ");
    Serial.println (timestamp);

    readLight();          //Check Ambient Light
    readSound();          //Check Ambient Sound
    readTemperature();    //Check Ambient Temperature
    readCarbonDioxide();  //Check Ambient Carbon Dioxide
    readHumidity();       //Check Ambient Humidity
    //readAir();          //Check Ambient Air
    
    //Prepare Sensor Log
    // parentPath= databasePath + "/" + String(timestamp);
    // json.set(tempPath.c_str(), String(ambientTemperatureReading));
    // json.set(co2Path.c_str(), String(ambientCO2Reading));
    // json.set(luxPath.c_str(), String(ambientLightReading));
    // json.set(decbPath.c_str(), String(ambientSoundReading));
    // json.set(partsPath.c_str(), String("1"));
    // json.set(humPath.c_str(), String(ambientHumidityReading));
    // json.set(fmhdPath.c_str(), String("1"));
    // json.set(motionPath.c_str(), String(motionActive));
    // json.set(timePath, String(timestamp));

    FirebaseJson content;
    parentPath= databasePath+ "/readings/"+ String(timestamp);
    //parentPath= databasePath;  //databasePath = "UsersData/" + uid + "/"; // Update database path
    content.set("fields/ambientTemperature/doubleValue", String(ambientTemperatureReading).c_str());
    content.set("fields/ambientCO2/doubleValue", String(ambientCO2Reading).c_str());
    content.set("fields/ambientLight/doubleValue", String(ambientLightReading).c_str());
    content.set("fields/ambientSound/doubleValue", String(ambientSoundReading).c_str());
    content.set("fields/ambientParticulates/doubleValue", String("1").c_str());
    content.set("fields/ambientHumidity/doubleValue", String(ambientHumidityReading).c_str());
    content.set("fields/ambientFormaldehyde/doubleValue", String("1").c_str());
    content.set("fields/motionDetect/doubleValue", String(motionActive).c_str());
    content.set("fields/time/doubleValue", String(timestamp).c_str());

    //Serial.printf("Set json... %s\n", Firebase.RTDB.setJSON(&fbdo, parentPath.c_str(), &json) ? "ok" : fbdo.errorReason().c_str());
    Serial.printf("Set json... %s\n", Firebase.Firestore.createDocument(&fbdo, PROJECT_ID, "", parentPath.c_str(), content.raw()) ? "ok" : fbdo.errorReason().c_str());
    Serial.println("= Telemetry pushed to CloudDB =");
    //enterDeepSleep();
  }
}