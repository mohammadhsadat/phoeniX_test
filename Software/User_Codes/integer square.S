.text
.globl sqrt


# int sqrt(int x)
# Calculates the integer square root of the input x
sqrt:
    # Initialize result to 0
    li t0, 0
    
    # Initialize step size to the largest power of 4 less than x
    li t1, 1
    slli t1, t1, 30
    bge a0, t1, cont
    srli t1, t1, 2
cont:
    
loop:
    # If the step size is 0, we're done
    beqz t1, done
    
    # Subtract the current step size from x
    sub t2, a0, t1
    
    # If the result is negative, the step size is too large
    bltz t2, next_step
    
    # Add the current step size to the result
    add t0, t0, t1
    
    # Subtract the current step size from x
    mv a0, t2
next_step:
    # Shift the step size right by 2 bits (divide by 4)
    srli t1, t1, 2
    
    j loop
    
done:
    # Return the result
    mv a0, t0
    ret
    ebreak