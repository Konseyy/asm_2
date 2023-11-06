.text
.align 2
.global matmul
.type matmul, %function

@ int matmul(int h1, int w1, int *m1, int h2, int w2, int *m2, int *m3);
matmul:
  stmfd sp!, {r0, r1, r2, r3, lr}
@ sp -> r0, r1, r2, r3, lr
@ # 0 = h1, #4 = w1, #8 = *m1, #12 = h2, #16 = LR, #20 = w2, #24 = *m2, #28 = *m3
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  ldr r5, [sp, #8]@ load *m1 into r5
@ ldr r0, [r5, #0] @ load m1[0] into r0
  ldr r1, [sp, #0]
  str r1, [r5, #0]
  str #5, [r5, #4]
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  ldr lr, [sp, #16]@ load original lr into lr
@ Stack: sp -> lr
  add sp, sp, #28 @ Clear the stack
@ return
  bx lr
@ h__a: .word height1
@ w__a: .word width1
f__1a:    .word format1
f__2a:    .word format2
.data
format1:  .asciz "from assembly H: %d\n"
format2:  .asciz "from assembly W: %d\n"
