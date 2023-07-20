lw x8,scoreplayer1
loop:
    lw x6,1025(x0) #recebe caractere do teclado
    lw x10,space #se for espaço, é a palavra do próximo player(player2)
    beq x6,x10,calcplayer1score #jump para função que calcula o score do player 1
    lw x10,point #se for ponto, acabou a leitura do player 2
    beq x6,x10,calcplayer2score #jump para função que calcula o score do player2

#   A,E,I,O,U = 1 ponto
    lw x10,A 
    beq x6,x10,onepoint
    lw x10,E
    beq x6,x10,onepoint
    lw x10,I
    beq x6,x10,onepoint
    lw x10,O 
    beq x6,x10,onepoint
    lw x10,U
    beq x6,x10,onepoint
#   K,R,S = 2 pontos
    lw x10,K
    beq x6,x10,twopoints
    lw x10,R
    beq x6,x10,twopoints
    lw x10,S
    beq x6,x10,twopoints
#   D,G,T = 3 pontos
    lw x10,D
    beq x6,x10,threepoints
    lw x10,G
    beq x6,x10,threepoints
    lw x10,T
    beq x6,x10,threepoints
#   F,H,V,W,Y = 4 pontos
    lw x10,F
    beq x6,x10,fourpoints
    lw x10,H
    beq x6,x10,fourpoints
    lw x10,V
    beq x6,x10,fourpoints
    lw x10,W
    beq x6,x10,fourpoints
    lw x10,Y
    beq x6,x10,fourpoints
#   B,C,M,N,P = 5 pontos
    lw x10,B
    beq x6,x10,fivepoints
    lw x10,C
    beq x6,x10,fivepoints
    lw x10,M
    beq x6,x10,fivepoints
    lw x10,N
    beq x6,x10,fivepoints
    lw x10,P
    beq x6,x10,fivepoints
#   J,L,X = 6 pontos
    lw x10,J
    beq x6,x10,sixpoints
    lw x10,L
    beq x6,x10,sixpoints
    lw x10,X
    beq x6,x10,sixpoints
#   Q,Z = 9 pontos
    lw x10,Q
    beq x6,x10,ninepoints
    lw x10,Z
    beq x6,x10,ninepoints
    





#Adiciona ao score de acordo com a pontuação da letra
onepoint:
    addi x8,x8,1
    jal x1,loop
twopoints:
    addi x8,x8,2
    jal x1,loop
threepoints:
    addi x8,x8,3
    jal x1,loop
fourpoints:
    addi x8,x8,4
    jal x1,loop
fivepoints:
    addi x8,x8,5
    jal x1,loop
sixpoints:
    addi x8,x8,6
    jal x1,loop
ninepoints:
    addi x8,x8,9
    jal x1,loop


calcplayer1score:
    sw x8,scoreplayer1
    xor x8,x8,x8
    jal ra,loop

calcplayer2score:
    sw x8,scoreplayer2
    xor x8,x8,x8

    
calcwinner:
    xor x6,x6,x6
    lw x6,scoreplayer1
    lw x8,scoreplayer2
    blt x6,x8,player2won
    beq x6,x8,tie
    jal ra,player1won
player1won:
    lw x5,P
    sb x5,1024(x0)
    lw x5,L
    sb x5,1024(x0)
    lw x5,A
    sb x5,1024(x0)
    lw x5,Y
    sb x5,1024(x0)
    lw x5,E
    sb x5,1024(x0)
    lw x5,R
    sb x5,1024(x0)
    lw x5,space
    sb x5,1024(x0)
    lw x5,one
    sb x5,1024(x0)

    jal ra,end
player2won:
    lw x5,P
    sb x5,1024(x0)
    lw x5,L
    sb x5,1024(x0)
    lw x5,A
    sb x5,1024(x0)
    lw x5,Y
    sb x5,1024(x0)
    lw x5,E
    sb x5,1024(x0)
    lw x5,R
    sb x5,1024(x0)
    lw x5,space
    sb x5,1024(x0)
    lw x5,two
    sb x5,1024(x0)
	jal ra,end
tie:
    lw x5,T
    sb x5,1024(x0)
    lw x5,I
    sb x5,1024(x0)
    lw x5,E
	sb x5,1024(x0)
 
end:

halt
two: .word 50
zero: .word 48
one: .word 49
point: .word 46
scoreplayer2: .word 0
scoreplayer1: .word 0
space: .word 32
A: .word 65
B: .word 66
C: .word 67
D: .word 68
E: .word 69
F: .word 70
G: .word 71
H: .word 72
I: .word 73
J: .word 74 
K: .word 75 
L: .word 76 
M: .word 77
N: .word 78
O: .word 79
P: .word 80
Q: .word 81
R: .word 82
S: .word 83
T: .word 84
U: .word 85 
V: .word 86
W: .word 87
X: .word 88
Y: .word 89
Z: .word 90
