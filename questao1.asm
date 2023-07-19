lw x10,a
lw x11,b
lw x12,c

lw x13,sixtytwo
lw x14,fifteen
lw x15, zero

lw x8,x
# a >= 0
bge x10,x15,greaterthanzero
blt x10,x15,done
# b >= 62
greaterthanzero:
bge x11,x13,greaterthansixtytwo
blt x11,x13,done
#c < 15
greaterthansixtytwo:
blt x12,x14,lowerthanfifteen
bge x12,x14,done

lowerthanfifteen:
addi  x8,x8,1


halt
a: .word 2
b: .word 65
c: .word 14
x : .word 0
sixtytwo: .word 62
fifteen: .word 15
zero: .word 0

zero: .word 0

