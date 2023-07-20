lw x8,playeronescore
loop:
    lw x6,1025(x0)
    lw x10,space 
    beq x6,x10,calcplayer1score
    lw x10,zero
    beq x6,x10,calcplayer2score

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


calcplayer2score:








halt
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
playeronescore: .word 0