lw x8,score #carrega o score inicializado com zero no registrador x8
loop: #inicia um loop pra ler a string
    lb x5,1025(x0) #carrega um caractere da string no registrador x5
    lw x6,space # compara o caractere com o valor ascii do espaço para saber o fim da string
    beq x5,x6,done # se for espaço, ele vai pro fim do código onde printa o score

#Abaixo temos comparações com o valor ascii das vogais A,E,I,O,U,a,e,i,o,u. Estas são carregadas no x6
    lw x6,A
    beq x5,x6,vogal #se for uma vogal ele vai para esta função
    lw x6,a
    beq x5,x6,vogal
    lw x6,E
    beq x5,x6,vogal
    lw x6,e
    beq x5,x6,vogal
    lw x6,i
    beq x5,x6,vogal
    lw x6,I
    beq x5,x6,vogal
    lw x6,O
    beq x5,x6,vogal
    lw x6,o
    beq x5,x6,vogal
    lw x6,U
    beq x5,x6,vogal
    lw x6,u
    beq x5,x6,vogal
#Se não for vogal, ele não dará nenhum beq e irá executar esta linha de código, direcionando pra função de consoante:
    jal x1,consonant



consonant:
 addi x8,x8,1 #Adiciona um ao score
 jal x1,loop #Volta pro loop
 


vogal:
jal x1,loop #Se for vogal, ele só roda o loop de novo

done: #Entra nessa função se receber espaço no keyboard
addi x8,x8,48 #Adiciona 48 pra poder printar em decimal
sb x8,1024(x0) #Printa na tela
halt #Finaliza o programa
#Declaração de váriaveis:::::::::::::::::::::::::::::::::::::
score: .word 0
A : .word 65
E: .word 69
I: .word 73
O: .word 79
U: .word 85
a: .word 97
e: .word 101
i: .word 105 
o: .word 111
u: .word 117
enter: .word 10
space : .word 32
