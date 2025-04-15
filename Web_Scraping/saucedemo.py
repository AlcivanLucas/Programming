from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import time
from selenium.webdriver.common.by import By

# Carregando as variáveis de ambiente do arquivo .env


# Mantém navegador aberto
options = webdriver.ChromeOptions()
options.add_experimental_option("detach", True)

service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service, options=options)

# Página de login
driver.get("https://www.saucedemo.com/")

# usuario = getpass.getpass("Digite seu usuário: ")
# senha = getpass.getpass("Digite sua senha: ")

usuario = "standard_user"
senha = "secret_sauce"

time.sleep(5)

# Login
campo_usuario = driver.find_element(By.ID, "user-name")
campo_senha = driver.find_element(By.ID, "password")
botao_login = driver.find_element(By.ID, "login-button")

campo_usuario.send_keys(usuario)
campo_senha.send_keys(senha)
botao_login.click()

# Aguarda carregamento da página
print("Aguarde enquanto as matérias são carregadas...")
time.sleep(10)


botao_add_card= driver.find_element(By.ID, "add-to-cart-sauce-labs-backpack")
botao_add_card.click()


botao_add_card = driver.find_element(By.ID, "add-to-cart-sauce-labs-bolt-t-shirt")
botao_add_card.click()