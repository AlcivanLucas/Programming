from selenium import webdriver
from selenium.webdriver.firefox.options import Options
from selenium.webdriver.firefox.service import Service
from webdriver_manager.firefox import GeckoDriverManager

options = Options()
options.add_argument("--no-sandbox")
options.add_argument("--disable-dev-shm-usage")
options.add_argument("-profile")
options.add_argument("/tmp/custom_firefox_profile")  # Caminho para um perfil temporário

service = Service(GeckoDriverManager().install())
driver = webdriver.Firefox(service=service, options=options)