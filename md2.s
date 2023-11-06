.text
.align 2
.global matmul
.type matmul, %function

@ int matmul(int h1, int w1, int *m1, int h2, int w2, int *m2, int *m3);
matmul:
  stmfd sp!, {r0, r1, r2, r3, lr}
@ sp -> lr, h1, w1, *m1, h2, w2, *m2, *m3
@ #0 = lr, #4 = h1, #8 = w1, #12 = *m1, #16 = h2, #20 = w2, #24 = *m2, #28 = *m3

  ldr r0, f__2a
  mov r1, lr
  bl printf

  ldr r0, f__1a @ load format string into r0
  ldr r1, [sp, #0]@ load original ro (first arg) into r1
@ Stack: sp -> r0, r1, lr
  bl printf

  ldr r0, f__2a @ load format string into r0
  ldr r1, [sp, #4]@ load original r1 (second arg) into r1
@ Stack: sp -> r1, lr
  bl printf

  ldr r0, f__1a
  ldr r1, [sp, #8]
  bl printf

  ldr r0, f__2a
  ldr r1, [sp, #12]
  bl printf

  ldr r0, f__1a
  ldr r1, [sp, #16]
  bl printf

  ldr r0, f__2a
  ldr r1, [sp, #20]
  bl printf

  ldr r0, f__1a
  ldr r1, [sp, #24]
  bl printf

  ldr r0, f__2a
  ldr r1, [sp, #28]
  bl printf

  ldr r0, f__1a
  ldr r1, [sp, #32]
  bl printf

  ldr r0, f__2a
  ldr r1, [sp, #36]
  bl printf

  ldr lr, [sp, #-4]@ load original r0 into r1
@ Stack: sp -> lr
  add sp, sp, #28 @ Stack: sp ->
@ return
  bx lr
@ h__a: .word height1
@ w__a: .word width1
f__1a:    .word format1
f__2a:    .word format2
.data
format1:  .asciz "from assembly H: %d\n"
format2:  .asciz "from assembly W: %d\n"
