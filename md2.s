.text
.align 2
.global matmul
.type matmul, %function

matmul:
  str lr, [sp, #4]!
  str r0, [sp, #4]!
  str r1, [sp, #4]!
  ldr r0, f__a
@ from stack pointer get first arg
  ldr r1, [sp, #4]!
  bl printf
  ldr r1, [sp, #4]!
  bl printf
  ldr lr, [sp, #4]!
@ h__a: .word height1
@ w__a: .word width1
f__a:   .word format
.data
format: .asciz "%d"
