import pandas as pd
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By

service = Service(executable_path='./chromedriver.exe')

options = webdriver.ChromeOptions()
options.add_experimental_option("detach", True)

driver = webdriver.Chrome(service=service, options=options)

url = 'https://www.google.com/'
driver.get(url)

# Esperar até o usuário pressionar Enter para fechar o navegador
input("Pressione Enter para fechar o navegador...")
