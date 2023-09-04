import bd as bd
from tkinter import *
from tkinter import ttk
import asyncio
import random

co0 = "#444466"

tela = Tk()
tela.title('Gol Show')
img = PhotoImage(file="imagens/fundo.png")
tela.attributes('-fullscreen',True)
tela.config(bg=co0)

canvas1 = Canvas( tela, width = 1024, 
                 height = 768) 
  
canvas1.pack(fill = "both", expand = True) 
canvas1.create_image( 0, 0, image = img,  
                     anchor = "nw") 
janela = Frame(canvas1,relief='flat',background='')
janela.grid(row=2,column=0)
pontos=0
perguntas = []
alts = []

def ranking(pontos,jogador):
    global tela3
    tela.destroy()
    tela2 = Tk()
    tela2.title('Gol Show')
    tela2.attributes('-fullscreen',True)
    tela2.config(bg=co0)
    cadastrar = bd.cadastrar_pontos(pontos,jogador)
    tree = ttk.Treeview(tela2,selectmode="browse",column=("coluna1","coluna2"),show='headings')

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
    tela2.mainloop
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
def inicio(cod,tela):
    frame_inicio = Frame(canvas1,width=550,height=100,relief='flat',background='')
    frame_inicio.grid(row=1,column=0)
    lbl1 = ttk.Label(frame_inicio,text='Gol Show',relief='flat',anchor=CENTER,font=('Fixedsys 20'))
    lbl1.place(x=400,y=5)
    alternativas = bd.consultar_alt(cod)
    pergunta = bd.consultar_pergunta(cod)
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
lbl2 = ttk.Label(canvas1,relief='flat',anchor=CENTER,font=('Fixedsys 10'),background='')
lbl2.place(x=200,y=100)
lbltxtpontos = ttk.Label(canvas1,relief='flat',text='Pontos',anchor=CENTER,font=('Fixedsys 10'),foreground='white')
lbltxtpontos.place(x=80,y=30)
lblpontos = ttk.Label(canvas1,relief='flat',anchor=CENTER,font=('Fixedsys 10'))
lblpontos.place(x=10,y=50)
btn1 = ttk.Button(canvas1)
btn1.place(x=400,y=300)
btn2 = ttk.Button(canvas1)
btn2.place(x=400,y=400)
btn3 = ttk.Button(canvas1)
btn3.place(x=400,y=500)
btn4 = ttk.Button(canvas1)
btn4.place(x=400,y=600)
btn5 = ttk.Button(canvas1)
btn5.place(x=400,y=700)
cod = random.randint(1,5)
perguntas.append(cod)
inicio(cod,tela)
def printInput(nome):
    global pontos
    ranking(pontos,nome)
def randomizar ():
    global pontos
    global tela3
    global perguntas
    alts.clear()
    #perguntas[2]
    #cod =2
    if len(perguntas) <5 :
        cod = random.randint(1,5)
        while cod in perguntas:
            cod = random.randint(1,5)
        perguntas.append(cod)
            #perguntas[2]
        inicio(cod,tela)
    else:

        tela3 = Tk()
        tela3.title('Gol Show')
        tela3.attributes('-fullscreen',True)
        tela3.config(bg=co0)
        print('acabou')
        inputtxt = ttk.Entry(tela3)
        inputtxt.pack()
        printButton = ttk.Button(tela3,text = "Print", command = printInput(inputtxt.get()))
        printButton.pack()
        tela3.mainloop()
tela.mainloop()