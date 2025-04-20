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
time.sleep(10)

# Função para clicar em 'Localizar Duplicatas'
def encontrar_duplicatas():
    try:
        # Clica no botão 'Mais'
        botao_mais = WebDriverWait(driver, 20).until(
            EC.element_to_be_clickable((By.XPATH, "//button[@title='Mais']"))
        )
        botao_mais.click()
        
        # Aguardando o menu de contexto aparecer (caso não tenha sido aberto ainda)
        menu = WebDriverWait(driver, 10).until(
            EC.visibility_of_element_located((By.CSS_SELECTOR, '.button-input__context-menu'))
        )

        # Localizando o item "Localizar duplicatas" pelo texto e clicando
        item_localizar_duplicatas = driver.find_element(By.XPATH, "//span[text()='Localizar duplicatas']")
        item_localizar_duplicatas.click()
        
        print("Processo de localização de duplicatas iniciado...")
        return True
        
    except Exception as e:
        print("Erro ao localizar elementos:", e)
        return False

# Loop principal (ajuste conforme necessidade)
while True:
    resultado = encontrar_duplicatas()
    
    if not resultado:
        break  # Sai do loop se houver erro
    
    # Tempo para processamento das duplicatas
    time.sleep(15)
    
    # Aqui você precisaria adicionar a lógica para tratar as duplicatas encontradas
    # (ex: selecionar, excluir, marcar, etc)
    
    # Exemplo de condição de saída (ajuste conforme necessário)
    # if not encontrou_mais_duplicatas:
    #     break

print("Processo concluído!")
# driver.quit()  # Descomente se quiser fechar o navegador ao final