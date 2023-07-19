lw x17,point # valor do ponto em ascii
lw x14,ten
lw x11,a
lw x12,b
lw x13,c
#carrega os 2 digitos de cada número do teclado
    # addi sp,sp,-40
    lb x5,1025(x0) # carrega o primeiro digito de a
    lb x6,1025(x0) # carrega o segundo digito de a
    lb x15,1025(x0) # carrega ou espaço ou ponto para saber quando ler outro numero ou quando finalizar leitura
    # sb x5,-40(sp)
    # sb x6,-32(sp)

    lb x7,1025(x0) # carrega o primeiro digito de b
    lb x8,1025(x0) # carrega o segundo digito de b
    lb x15,1025(x0) # carrega ou espaço ou ponto para saber quando ler outro numero ou quando finalizar leitura
    # sb x7,-24(sp) 
    # sb x8,-16(sp)

    lb x9,1025(x0) # carrega o primeiro digito de c
    lb x10,1025(x0) # carrega o segundo digito de c
    lb x15,1025(x0) # carrega ou espaço ou ponto para saber quando ler outro numero ou quando finalizar leitura
    # sb x7,-8(sp) 
    # sb x8,-0(sp)
    beq x15,x17,convert2ascii


convert2ascii:
    addi x5,x5,-48
    addi x6,x6,-48
    addi x7,x7,-48
    addi x8,x8,-48
    addi x9,x9,-48
    addi x10,x10,-48
    jal x1,turn2digit
turn2digit:
    add x11,x11,x5
    add x12,x12,x7
    add x13,x13,x9
    addi x14,x14,-1
    beq x14,x0,nextstep
    jal x1,turn2digit

nextstep:
    add x11,x11,x6
    add x12,x12,x8
    add x13,x13,x10
    xor x5,x5,x5
    xor x6,x6,x6
    xor x7,x7,x7
    xor x8,x8,x8
    xor x9,x9,x9
    xor x10,x10,x10
    jal ra,logic
logic:
    lw x5,x
    lw x6,sixtytwo
    lw x7,fifteen
    lw x9,zero
    
    bge x11,x9,ifgreaterzero
    blt x11,x9,printzero

ifgreaterzero:
    beq x12,x6,iflowerequalsixtytwo
    blt x12,x6,iflowerequalsixtytwo
    jal x1,printzero
iflowerequalsixtytwo:
    blt x13,x7,printone
    jal x1,printzero
    
printone:
    addi x5,x5,1
    sw x5,1024(x0)
    jal x1,done
printzero:
  
    sb x5,1024(x0)
    jal x1,done
done:
halt

ten: .word 10
x : .word 48
a : .word 0
sixtytwo: .word 62
fifteen: .word 15
zero: .word 0
b: .word 0
c: .word 0
point: .word 46


