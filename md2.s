.text
.align 2
.global matmul
.type matmul, %function

matmul:
  sub sp, sp, #12
  stmia sp!, {lr, r0, r1}
  ldr r0, f__a
@ from stack pointer get first arg
  ldr r1, [sp, #4]!
  bl printf
  ldr r1, [sp, #4]!
  bl printf
  ldr lr, [sp, #4]!
// return
  bx lr
@ h__a: .word height1
@ w__a: .word width1
f__a:   .word format
.data
format: .asciz "%d"
