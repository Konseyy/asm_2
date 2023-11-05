.text
.align 2
.global matmul
.type matmul, %function

asum:
  mov r5, #0 // initialize sum variable to 0
  cmp r0, #0 // r0 holds the iterator for ramining loops
  beq end // if r0 is 0, return 0
loop:
  add r5, r5, r0 // add r0 to sum
  sub r0, r0, #1 // decrement r0 for next loop iteration
  cmp r0, #0 // check if loop is finished
  bne loop // if r0 is not 0, loop again, else return
end:
  mov r0, r5 // move sum to r0
  bx lr // return
