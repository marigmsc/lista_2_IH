#carrega as variáveis a,b,c,x da mémoria em registradores x10,x11,x12,x8 respectivamente
lw x10,a
lw x11,b
lw x12,c
lw x8,x


#carrega as condições 62,15,0 da mémoria em registradores x13,x14,x15 respectivamente
lw x13,sixtytwo
lw x14,fifteen
lw x15, zero

#IF (a >= 0 && b <= 62 && c < 15) x = 1;
#ELSE x = 0; // x já está inicializado como zero, e só mudará caso atenda as três condições

# PRIMEIRA CONDIÇÃO( a >= 0 )
bge x10,x15,ifgreaterzero # a está em x10, 0 em x15. se (a >= 0) ele vai pra ifgreaterzero
blt x10,x15,done # a está em x10, 0 em x15. se (a < 0) ele vai pra done que encerra o programa
# SEGUNDA CONDIÇÃO( b <= 62 )
ifgreaterzero: 
    beq x11,x13,iflowerequalsixtytwo # b está em x11, 62 em x13. se (b == 62) ele vai pra iflowerequalsixtytwo
    blt x11,x13,iflowerequalsixtytwo # b está em x11, 62 em x13. se (b < 62) ele também vai pra iflowerequalsixtytwo
    jal ra,done #se não cumprir as condições , redireciona para função done que encerra o programa

#TERCEIRA CONDIÇÃO (c < 15 )
iflowerequalsixtytwo:
    blt x12,x14,iflowerfifteen # c está em x12, 15 em x14. se (c < 15) ele vai pra iflowerfifteen
    bge x12,x14,done # c está em x12, 15 em x14. se (c >= 15) ele vai pra done que encerra o programa

iflowerfifteen:
    addi  x8,x8,1 #se cumprir as três condições adiciona um a x, que está em x8

done:
    halt #encerra o programa
#declaração de variáveis::::::::::::::::::::::::::;
a: .word 0
b: .word 62
c: .word 13
x : .word 0
sixtytwo: .word 62
fifteen: .word 15
zero: .half 0
