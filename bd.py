import pyodbc
import asyncio
def conectar():
    con = pyodbc.connect('Driver={SQL Server};'
                        'Server=GUSTAVO_DESKTOP;'
                        'Database=dbGolshow;'
                        'Trusted_Connection=yes;')
    return con
def consultar_pergunta(cod):
    Per = []
    x = cursor.execute(f"SELECT * FROM tbPergunta WHERE codPergunta ={cod}")
    for linha in x:
        Per = linha[1]
    return Per
def consultar_alt(cod):
    cursor.close
    x = cursor.execute(f"SELECT * FROM tbAlternativa WHERE codPergunta ={cod}")
    alternativas = []
    verdadeiras = []
    matrizPerguntas=[]
    for linha in x:
        alternativas.append(linha[1])
        verdadeiras.append(linha[2])
    matrizPerguntas.append(verdadeiras)
    matrizPerguntas.append(alternativas)
    return matrizPerguntas
    #print(a[1][0])
    #print(alternativas)
def adicionarPerguntas(alt):
    i=1
    for l in alt[0]:
        print(f'{i}- {l}')
        i+=1
def cadastrar_pontos(pontos,jogador):
    x = cursor.execute(f"INSERT INTO tbJogador values ('{jogador}',{pontos})")
    con.commit()
    print('Pontos Salvos')
def mostrar_ranking():
    print('Melhores Jogadores')
    x = cursor.execute(f"SELECT TOP 10 (nome),pontuacao FROM tbJogador order by pontuacao desc")
    return x

print(conectar())
con = conectar()
cursor = con.cursor()
