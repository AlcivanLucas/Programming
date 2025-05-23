from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import time
from selenium.webdriver.common.by import By
import getpass

# Mantém navegador aberto
options = webdriver.ChromeOptions()
options.add_experimental_option("detach", True)

service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service, options=options)

# Página de login
driver.get("https://icev.digital/login/index.php")

usuario = getpass.getpass("Digite seu usuário: ")
senha = getpass.getpass("Digite sua senha: ")

# Login
campo_usuario = driver.find_element(By.ID, "username")
campo_senha = driver.find_element(By.ID, "password")
botao_login = driver.find_element(By.ID, "loginbtn")

campo_usuario.send_keys(usuario)
campo_senha.send_keys(senha)
botao_login.click()

# Aguarda carregamento da página
print("Aguarde enquanto as matérias são carregadas...")
time.sleep(5)

# Coleta todas as matérias
materias = driver.find_elements(By.CSS_SELECTOR, "div.card.dashboard-card div.data h4.title a")

# Exibe no terminal
print("Matérias disponíveis:")
for i, materia in enumerate(materias):
    nome = materia.text
    print(f"[{i}] {nome}")

# Usuário escolhe uma matéria
indice = int(input("Escolha o índice da matéria desejada: "))
materias[indice].click()

# Aguarda carregamento da página da matéria
print("Carregando a matéria selecionada...")
time.sleep(5)

# A partir daqui você pode extrair quizzes da página aberta
