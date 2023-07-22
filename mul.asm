lw x5, multiplicand
lw x6, multiplier
lw x7, multiplier0
lw x8, one
lw x9, product
lw x10, loop_index
lw x11, loop_limit

multiply:
    addi x10, x10, 1
    andi x7, x6, 1

    beq x7, x8, eq_one
    beq x7, x0, continue

    eq_one:
        add x9, x9, x5
        jal ra, continue

    continue:
        slli x5, x5, 1
        srli x6, x6, 1
        beq x10, x11, end
        jal ra, multiply

end:
    halt

multiplicand: .word 12
multiplier: .word 8
product: .word 0
multiplier0: .word 0
one: .word 1
loop_index: .word 0
loop_limit: .word 32


