import re
import csv
import time
from getpass import getpass
from time import sleep
from selenium.webdriver.common.keys import Keys
from selenium.common.exceptions import NoSuchElementException
from selenium import webdriver
from selenium.webdriver.common.by import By
from datetime import datetime
import pandas as pd



search = input("Search: ")
print("Twitter Search Feature:")
print("[1] Top")
print("[2] Latest")
user = int(input("Select the search feature: "))

print("Please follow the  'YYYY-MM-DD' format")
date_limiter = input("Until what date: ")
date_limiter_object = datetime.strptime(date_limiter, '%Y-%m-%d').date()

time.sleep(3)
driver = webdriver.Edge()
driver.get('https://www.twitter.com/login')
driver.maximize_window()

time.sleep(3)
username = driver.find_element(By.XPATH, "//input[@name='text']")
username.send_keys("esg_artemis")
next_button = driver.find_element(By.XPATH, "//span[contains(text(),'Next')]")
next_button.click()

time.sleep(3)
password = driver.find_element(By.XPATH, "//input[@name='password']")
password.send_keys('artemis.esg1')
log_in = driver.find_element(By.XPATH, "//span[contains(text(),'Log in')]")
log_in.click()

time.sleep(3)
search_box = driver.find_element(By.XPATH, "//input[@data-testid='SearchBox_Search_Input']")
search_box.send_keys(search)
search_box.send_keys(Keys.ENTER)

time.sleep(3)
if user == 1:  # Top
    top = driver.find_element(By.XPATH,
                              '//*[@id="react-root"]/div/div/div[2]/main/div/div/div/div[1]/div/div[1]/div[1]/div[2]/nav/div/div[2]/div/div[1]/a/div/span')
    top.click()
elif user == 2:  # Latest
    latest = driver.find_element(By.XPATH,
                                 '//*[@id="react-root"]/div/div/div[2]/main/div/div/div/div[1]/div/div[1]/div[1]/div[2]/nav/div/div[2]/div/div[2]/a/div/span')
    latest.click()

sleep(3)
# number_of_tweets = int(input("How many tweets you want to get? "))
Usernames = []
TimeStamps = []
Tweets = []
Replies = []
Retweets = []
Likes = []

articles = driver.find_elements(By.XPATH, "//article[@data-testid='tweet']")
TimeStamp = driver.find_element(By.XPATH, ".//time").get_attribute('datetime')

while True:
    for article in articles:
        Username = driver.find_element(By.XPATH, ".//div[@data-testid='User-Names']").text

        TimeStamp = driver.find_element(By.XPATH, ".//time").get_attribute('datetime')
        Tweet = driver.find_element(By.XPATH, ".//div[@data-testid='tweetText']").text
        Reply = driver.find_element(By.XPATH, ".//div[@data-testid='reply']").text
        Retweet = driver.find_element(By.XPATH, ".//div[@data-testid='retweet']").text
        Like = driver.find_element(By.XPATH, "//div[@data-testid='like']").text

        Date_no_time = TimeStamp[:10]
        Date_no_time_object = datetime.strptime(Date_no_time, '%Y-%m-%d').date()

        # No repetitive tweets will fetch
        if Tweet not in Tweets:
            Usernames.append(Username)
            TimeStamps.append(TimeStamp)
            Tweets.append(Tweet)
            Replies.append(Reply)
            Retweets.append(Retweet)
            Likes.append(Like)

    # Date limiter
    if date_limiter_object > Date_no_time_object:
        break

    sleep(3)
    articles = driver.find_elements(By.XPATH, "//article[@data-testid='tweet']")

dataframe = {'UserName': Usernames, 'TimeStamps': TimeStamps, 'Tweets': Tweets, 'Replies': Replies,
             'Retweets': Retweets, 'Likes': Likes}
df = pd.DataFrame(dataframe)
df.to_csv(search + '.csv', encoding='utf-8')