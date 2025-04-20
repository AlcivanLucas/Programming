from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import time
from selenium.webdriver.common.by import By
import getpass
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from dotenv import load_dotenv
import os
load_dotenv()
usuario = os.getenv("usuario")
senha = os.getenv("senha")

# Configuração do driver
options = webdriver.ChromeOptions()
options.add_experimental_option("detach", True)

service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service, options=options)

# Página de login do kommo 
driver.get("https://marciacastro.kommo.com/contacts/list/contacts")

# # Credenciais
# usuario = getpass.getpass("Digite seu usuário: ")
# senha = getpass.getpass("Digite sua senha: ")

# Login
try:
    campo_usuario = WebDriverWait(driver, 10).until(
        EC.presence_of_element_located((By.ID, "session_end_login"))
    )
    campo_usuario.send_keys(usuario)
    
    campo_senha = driver.find_element(By.ID, "password")
    campo_senha.send_keys(senha)
    
    botao_login = driver.find_element(By.ID, "auth_submit")
    botao_login.click()
    
except Exception as e:
    print("Erro no login:", e)

# Aguarda carregamento da página
print("Aguarde o carregamento da plataforma...")
# time.sleep(10)

# Clica no botão 'Mais'
# botao_mais = WebDriverWait(driver, 20).until(
#     EC.element_to_be_clickable((By.XPATH, "//button[@title='Mais']"))
# )
# botao_mais.click()



# XPath por texto visível (mais confiável)
# XPATH_DUPLICATAS = "//*[contains(text(), 'Localizar Duplicatas')]"

# # Ou usando atributos específicos (se existirem)
# XPATH_DUPLICATAS = "//div[contains(@class, 'menu-item') and text()='Localizar Duplicatas']"

# Aguarda e clica em "Localizar Duplicatas"
# opcao_duplicatas = WebDriverWait(driver, 20).until(
#     EC.element_to_be_clickable((By.XPATH, "//(text(), 'Localizar Duplicatas')"))
# )
# opcao_duplicatas.click()

try:
    # 1. Clica no botão "Mais"
    botao_mais = WebDriverWait(driver, 20).until(
        EC.element_to_be_clickable((By.XPATH, "//button[@title='Mais']"))
    )
    botao_mais.click()

    # 2. Espera o menu (UL) ficar visível
    WebDriverWait(driver, 20).until(
        EC.visibility_of_element_located((By.XPATH, "//ul[@class='button-input__context-menu ']"))
    )

    # 3. XPath específico para o item "Localizar duplicatas"
    XPATH_DUPLICATAS = """
        //ul[@class='button-input__context-menu ']
        /li[contains(@class, 'js-list-duplicate-contacts-search')]
        //span[@class='button-input__context-menu__item__text' 
               and normalize-space()='Localizar duplicatas']
    """

    # 4. Aguarda e clica no elemento
    opcao_duplicatas = WebDriverWait(driver, 20).until(
        EC.element_to_be_clickable((By.XPATH, XPATH_DUPLICATAS))
    )
    opcao_duplicatas.click()

except Exception as e:
    print("Erro:", e)
    driver.save_screenshot("erro.png")  # Para debug