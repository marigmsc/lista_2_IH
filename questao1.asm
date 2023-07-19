lw x10,a
lw x11,b
lw x12,c

lw x13,sixtytwo
lw x14,fifteen
lw x15, zero

lw x8,x
# a >= 0
bge x10,x15,greaterzero
blt x10,x15,done
# b <= 62
greaterzero:
beq x11,x13,lowerequalsixtytwo
blt x11,x13,lowerequalsixtytwo
#c < 15
lowerequalsixtytwo:
blt x12,x14,lowerfifteen
bge x12,x14,done

lowerfifteen:
addi  x8,x8,1
done:
halt
a: .word 0
b: .word 62
c: .word 13
x : .word 0
sixtytwo: .word 62
fifteen: .word 15
zero: .half 0

