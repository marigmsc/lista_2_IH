lw x5, multiplicand
lw x6, multiplier
lw x7, multiplier0
lw x8, one
lw x9, product
lw x10, loop_index
lw x11, loop_limit
lw x12, char_num
lw x13, point_char
lw x14, space_char
lw x15, mult_index
lw x16, number_a
lw x17, input_flag
lw x18, ten

receive_number:
    lw x12, 1025(x0)
    beq x12, x13, end_input     # término do input no char de ponto final
    #beq x12, x14, prep_next_num # preparo dos registradores para receber o próx número 

    sw x9, product
    lw x15, product # arrumar

    sw x12, multiplicand
    sw x15, multiplier
    lw x5, multiplicand
    lw x6, multiplier

    xor x17, x17, x17
    addi x17, x17, 1
    xor x10, x10, x10
    jal ra, multiply

    next_step:
        add x16, x16, x9
        xor x9, x9, x9

        sw x15, multiplicand
        sw x18, multiplier
        lw x5, multiplicand
        lw x6, multiplier

        xor x17, x17, x17
        xor x10, x10, x10
        addi x17, x17, 10
        jal ra, multiply

        

    end_input:
        jal ra, end



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
        beq x10, x11, control
        jal ra, multiply

control:
    beq x17, x0, not_input
    beq x17, x8, next_step
    beq x17, x18, receive_number


end:
    halt

multiplicand: .word 0
multiplier: .word 0
product: .word 1
multiplier0: .word 0
one: .word 1
ten: .word 10
loop_index: .word 0
loop_limit: .word 32
char_num: .word 0
space_char: .word 32
point_char: .word 46
mult_index: .word 1
number_a: .word 0
input_flag: .word 1
