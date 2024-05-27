Computer Organization - Spring 2024
==============================================================
## Iran Univeristy of Science and Technology
## Assignment 1: Assembly code execution on phoeniX RISC-V core

- Name:mohammad Hosein sadat
- Team Members:_
- Student ID: 400412256
- Date:28/5/2024

## Report
# phoeniX RISC-V Processor Assignment

## Overview
This assignment involves running and executing assembly code on the phoeniX RISC-V Processor, which was initiated in the summer of 2023 at the Electronics Research Center of Iran University of Science and Technology.

The core features of the phoeniX processor include:
- Optimized 3-stage pipeline
- Modularity and extensiveness
- A novel platform for approximate computing

In this assignment, I have completed the following tasks:

1. Forked the phoeniX repository to my own GitHub account and cloned it to my local machine.
2. Implemented the following RISC-V assembly code:
   - Quick Sort (RV32I)
   - Integer Square Root (RV32IM)
3. Ran and debugged the assembly code using the Venus Simulator on Visual Studio Code, and then generated the final firmware file using the AssembleX software.

The source code for the two problems is provided in the Software/User_Codes directory of the repository.

## Quick Sort

The quick sort algorithm is implemented in the quicksort function. The function takes an array address (`a0`) and the size of the array (`a1`) as input parameters, and performs the quick sort algorithm in-place.

The partition function is used to partition the array around a pivot element, and the quicksort function recursively sorts the left and right sub-arrays.

## Integer Square Root

The integer square root algorithm is implemented in the isqrt function. The function takes an input number (`a0`) and returns the integer square root of the input (`a0`).

The algorithm uses a simple iterative approach to find the square root, incrementing the result until the square of the result is greater than or equal to the input.

## Execution and Debugging

The assembly code was executed and debugged using the RISC-V Venus Simulator in Visual Studio Code. The final firmware file was generated using the AssembleX software.

The waveform file generated after execution helps with tracing register file values to check the correct execution of the code.

## Conclusion

This assignment allowed me to familiarize myself with the phoeniX RISC-V processor and its features, as well as gain experience in writing and executing RISC-V assembly code. The modular and extensible design of the phoeniX processor makes it a suitable platform for exploring and implementing approximate computing techniques.
- Wirte your report and the final result of the assembly code here!
- Attach the waveform image to the README.md file