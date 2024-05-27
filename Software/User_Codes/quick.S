# RISC-V (RV32I) assembly code for Quick Sort

# Function to partition the array
partition:
    addi sp, sp, -24
    sw ra, 20(sp)
    sw s0, 16(sp)
    sw s1, 12(sp)
    sw s2, 8(sp)
    sw s3, 4(sp)
    sw s4, 0(sp)

    mv s0, a0     # s0 = arr
    mv s1, a1     # s1 = low
    mv s2, a2     # s2 = high
    mv s3, a1     # s3 = pivot_index = low

    # Choose the rightmost element as pivot
    mv s4, a2
    lw t0, 0(s4)
    mv a3, t0    # pivot = arr[high]

    # Partition the array around the pivot
loop:
    mv a0, s0
    mv a1, s3
    mv a2, a3
    jal ra, partition_helper
    mv s3, a0    # pivot_index = partition_helper(arr, pivot_index, pivot)

    # Swap arr[high] and arr[pivot_index]
    slli t0, s3, 2
    add t0, s0, t0
    lw t1, 0(t0)
    lw t2, 0(s4)
    sw t1, 0(s4)
    sw t2, 0(t0)

    # Partition the left and right subarrays
    mv a0, s0
    mv a1, s1
    addi a2, s3, -1
    jal ra, quicksort
    mv a0, s0
    addi a1, s3, 1
    mv a2, s2
    jal ra, quicksort

    lw ra, 20(sp)
    lw s0, 16(sp)
    lw s1, 12(sp)
    lw s2, 8(sp)
    lw s3, 4(sp)
    lw s4, 0(sp)
    addi sp, sp, 24
    ret

# Helper function to partition the array
partition_helper:
    addi sp, sp, -16
    sw ra, 12(sp)
    sw s0, 8(sp)
    sw s1, 4(sp)
    sw s2, 0(sp)

    mv s0, a0   # s0 = arr
    mv s1, a1   # s1 = i (pivot_index)
    mv s2, a2   # s2 = pivot

    # Iterate through the array, swapping elements less than the pivot
    # to the left of the pivot_index
    li t0, 0    # j = 0
    addi a1, s1, 1  # i = pivot_index + 1
loop2:
    beq a1, a2, done
    slli t1, a1, 2
    add t1, s0, t1
    lw t2, 0(t1)
    bge t2, s2, next
    slli t3, s1, 2
    add t3, s0, t3
    lw t4, 0(t3)
    sw t2, 0(t3)
    sw t4, 0(t1)
    addi s1, s1, 1
next:
    addi a1, a1, 1
    j loop2
done:
    mv a0, s1
    lw ra, 12(sp)
    lw s0, 8(sp)
    lw s1, 4(sp)
    lw s2, 0(sp)
    addi sp, sp, 16
    ret

# Main function to sort the array
quicksort:
    addi sp, sp, -8
    sw ra, 4(sp)
    sw s0, 0(sp)

    mv s0, a0   # s0 = arr
    mv a0, s0
    mv a1, a1   # low
    mv a2, a2   # high
    jal ra, partition

    lw ra, 4(sp)
    lw s0, 0(sp)
    addi sp, sp, 8
    ret
    ebreak