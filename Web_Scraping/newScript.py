from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import time
from selenium.webdriver.common.by import By
import getpass
from dotenv import load_dotenv
import os
# Carregando as variáveis de ambiente do arquivo .env


# Mantém navegador aberto
options = webdriver.ChromeOptions()
options.add_experimental_option("detach", True)

service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service, options=options)

# Página de login
driver.get("https://icev.digital/login/index.php")

# usuario = getpass.getpass("Digite seu usuário: ")
# senha = getpass.getpass("Digite sua senha: ")
load_dotenv()
usuario = os.getenv("usuario")
senha = os.getenv("senha")

time.sleep(5)

# Login
campo_usuario = driver.find_element(By.ID, "username")
campo_senha = driver.find_element(By.ID, "password")
botao_login = driver.find_element(By.ID, "loginbtn")

campo_usuario.send_keys(usuario)
campo_senha.send_keys(senha)
botao_login.click()

# Aguarda carregamento da página
print("Aguarde enquanto as matérias são carregadas...")
time.sleep(10)

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





# Coleta todos os quizzes
quizzes = driver.find_elements(By.CSS_SELECTOR, "li.activity.modtype_quiz .activityname a")

print(f"Foram encontrados {len(quizzes)} quizzes nesta matéria:")
for i, quiz in enumerate(quizzes):
    titulo_quiz = quiz.text
    link_quiz = quiz.get_attribute('href')
    print(f"[{i}] {titulo_quiz} - {link_quiz}")

