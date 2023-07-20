lw x7, divisor
lw x8, remainder
lw x9, quotient
lw x10, index
lw x11, loop_limit

division:
    addi x10, x10, 1
    sub x8, x7, x8
    bge x8, x0, test_rem_gte0
    blt x8, x0, test_rem_lt0

    test_rem_gte0:
        slli x9, x9, 1
        jal ra, continue

    test_rem_lt0:
        add x8, x7, x8
        slli x9, x9, 1
        jal ra, continue

    continue:
        srli x7, x7, 1
        blt x10, x11, division


halt

divisor: .word 2
remainder: .word 0
quotient: .word 0
index: .word 0
loop_limit: .word 34

