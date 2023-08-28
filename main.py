import bd as bd
from tkinter import *
from tkinter import ttk
import asyncio
import random

co0 = "#444466"

tela = Tk()
tela.title('Gol Show')
tela.geometry('550x510')
tela.config(bg=co0)
janela = Frame(tela,width=550,height=600,relief='flat')
janela.grid(row=2,column=0)
pontos=0
perguntas = []
alts = []

def ranking(pontos,jogador):
    cadastrar = bd.cadastrar_pontos(pontos,jogador)
    tree = ttk.Treeview(janela,selectmode="browse",column=("coluna1","coluna2"),show='headings')

    tree.column("coluna1",width=200,minwidth=50,stretch=NO)
    tree.heading("#1",text='Nome')

    tree.column("coluna2",width=100,minwidth=50,stretch=NO)
    tree.heading("#2",text='Pontos')
    rk = bd.mostrar_ranking()
    valor = []
    for jogadores in rk:
        print(jogadores)
        valor.append(jogadores[0])
        valor.append(jogadores[1])
        tree.insert("",END,values=valor,tag='1')
        valor.clear()
    tree.grid(row=0,column=0)
#ranking()
def resposta(value):
    valor = value
    if valor == True:
        global pontos
        pontos +=100
        print(pontos)
        randomizar()
    else:
        #som
        #lblpontos['background'] = co0
        print('ERROOOU')
        randomizar()
    print(valor)
async def inicio(cod,tela):
    frame_inicio = Frame(tela,width=550,height=100,relief='flat')
    frame_inicio.grid(row=1,column=0)
    lbl1 = ttk.Label(frame_inicio,text='Gol Show',relief='flat',anchor=CENTER,font=('Fixedsys 20'))
    lbl1.place(x=200,y=5)
    alternativas = await bd.consultar_alt(cod)
    pergunta = await bd.consultar_pergunta(cod)
    lblpontos['text'] = pontos
    lbl2['text'] = pergunta
    cod = random.randint(1,4)
    global alts
    #perguntas[2]
    alt = random.randint(0,4)
    #cod =2
    while len(alts) <5 :
        while alt in alts:
            alt = random.randint(0,4)
        alts.append(alt)
    btn1['text'] = alternativas[0][alts[0]]
    btn1['command'] = lambda:resposta(alternativas[1][alts[0]])
    btn2['text'] = alternativas[0][alts[1]]
    btn2['command'] = lambda:resposta(alternativas[1][alts[1]])
    btn3['text'] = alternativas[0][alts[2]]
    btn3['command'] = lambda:resposta(alternativas[1][alts[2]])
    btn4['text'] = alternativas[0][alts[3]]
    btn4['command'] = lambda:resposta(alternativas[1][alts[3]])
    btn5['text'] = alternativas[0][alts[4]]
    btn5['command'] = lambda:resposta(alternativas[1][alts[4]])
    print(pergunta)
lbl2 = ttk.Label(janela,relief='flat',anchor=CENTER,font=('Fixedsys 10'))
lbl2.place(x=10,y=100)
lbltxtpontos = ttk.Label(janela,relief='flat',text='Pontos',anchor=CENTER,font=('Fixedsys 10'))
lbltxtpontos.place(x=10,y=30)
lblpontos = ttk.Label(janela,relief='flat',anchor=CENTER,font=('Fixedsys 10'))
lblpontos.place(x=10,y=50)
btn1 = ttk.Button(janela)
btn1.place(x=80,y=200)
btn2 = ttk.Button(janela)
btn2.place(x=80,y=250)
btn3 = ttk.Button(janela)
btn3.place(x=400,y=200)
btn4 = ttk.Button(janela)
btn4.place(x=400,y=250)
btn5 = ttk.Button(janela)
btn5.place(x=400,y=300)
cod = random.randint(1,10)
asyncio.run(inicio(cod,tela))
def randomizar ():
    global pontos
    global perguntas
    alts.clear()
    #perguntas[2]
    cod = random.randint(1,10)
    #cod =2
    if len(perguntas) <5 :
        while cod in perguntas:
            cod = random.randint(1,5)
        perguntas.append(cod)
            #perguntas[2]
        asyncio.run(inicio(cod,tela))
    else:
        print('acabou')
        ranking(4000000,'Gustavo Teste')
tela.mainloop()