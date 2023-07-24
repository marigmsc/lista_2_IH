lw x7,zero
lw x9,two
lw x8,flag
lw x11,a
lw x17, point
lw x18, minus
#carrega os 2 digitos de cada número do teclado
# OBS: SE SEU INPUT FOR DE UM DIGITO DIGITE ZERO ANTES. EX: 05,04,02. SE FOR NEGATIVO APENAS -2,-5,-4


receivenumber:
    lb x5,1025(x0) # carrega o primeiro digito de a
    lb x6,1025(x0) # carrega o segundo digito de a
    lb x15,1025(x0) # carrega ou espaço ou ponto para saber quando ler outro numero ou quando finalizar leitura
    beq x5,x18,printzero 
    beq x8,x7, firstcondition
    jal x1,convert2ascii

firstcondition:
    addi x7,x7,1
    jal x1,receivenumber

convert2ascii:
	xor x11, x11, x11
    lw x14, ten
    addi x5,x5,-48
    addi x6,x6,-48

turn2digit: 
    add x11,x11,x5
    addi x14,x14,-1
    beq x14,x0,nextstep
    jal x1,turn2digit


nextstep:
    add x11,x11,x6
    addi x14,x14,10
    addi x8,x8,1
    beq x8,x7,secondcondition
    beq x8,x9,thirdcondition
	beq x15, x17, thirdcondition
    jal x1,printone
   

secondcondition:
    addi x8, x8, 1
    lw x13,sixtytwo
    beq x11,x13,receivenumber
    blt x11,x13,receivenumber
    jal x1,printzero

thirdcondition:
    lw x13,sixteen
    blt x11,x13,printzero
    jal x1,printone

printone:
    xor x5,x5,x5
    addi x5,x5,49
    sw x5,1024(x0)
    jal x1,done
printzero:
    xor x5,x5,x5
    addi x5,x5,48
    sb x5,1024(x0)
    jal x1,done
done:
halt

ten: .word 10
x : .word 48
a : .word 0
sixtytwo: .word 62
sixteen: .word 16
zero: .word 0
one: .word 1
two: .word 2
b: .word 0
c: .word 0
flag: .word 0
point: .word 46
minus: .word 45

