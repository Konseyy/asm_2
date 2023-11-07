.text
.align 2
.global matmul
.type matmul, %function

@ str r1, [r5, #0] ---- stores r1 into *r5[0]

@ int matmul(int h1, int w1, int *m1, int h2, int w2, int *m2, int *m3);
matmul:
  stmfd sp!, {r0-r12, lr}
@ sp -> r0, r1, r2, r3, r4, r5 ,r6 ,r7, r8, r9, r10, r11, r12, lr
@ # 0 = h1, #4 = w1, #8 = *m1, #12 = h2, #16=R4 #20=R5
@ #24=R6 #28=R7 #32=R8 #36=R9 #40=R10 #44=R11 #48=R12
@ #52 = LR, #56 = w2, #60 = *m2, #64 = *m3
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  mov r5, #0 @ i = 0
  mov r6, #0 @ j = 0
  mov r7, #0 @ k = 0
for_i:
  ldr r3, [sp, #0]@ load h1 into r3
  cmp r5, r3 @ i < h1
  bge end_for_i
  mov r6, #0 @ j = 0
for_j:
  ldr r4, [sp, #56]@ load w2 into r4
  cmp r6, r4 @ j < w2
  bge end_for_j
  mov r7, #0 @ k = 0
for_k:
  ldr r2, [sp, #12]@ load h2 into r2
  cmp r7, r2 @ k < h2
  bge end_for_k
@ Multiplication happens here
  mov r10, r5, LSL#2 @ i * 4
  mul r8, r10, r2 @ i * w1 * 4
  mov r9, r7, LSL#2
  add r8, r8, r9 @ i * w1 * 4 + k * 4
  ldr r0, [sp, #8] @ load *m1 into r0
  ldr r2, [r0, r8] @ load m1[i][k] into r2
  ldr r0, f__i
  mov r1, r2
  bl printf
  mul r8, r9, r4 @ j * 4 * w2 
  mov r10, r6, LSL#2 @ j * 4
  add r8, r8, r10@ j * 4 * w2 + k * 4
  ldr r1, [sp, #60] @ load *m2 into r1
  ldr r3, [r1, r8] @ load m2[k][j] into r3
  ldr r0, f__j
  mov r1, r3
  bl printf
@ mul r4, r2, r3 @ m1[i][k] * m2[k][j]
@ ldr r0, [sp, #64] @ load *m3 into r0
@ mul r8, r5, r4 @ i * w2
@ add r8, r8, r6 @ i * w2 + j
@ ldr r1, [r0, r8] @ load m3[i][j] into r1
@ add r2, r4, r1 @ m3[i][j] += m1[i][k] * m2[k][j]
@ str r2, [r0, r8] @ store m3[i][j] into *m3
@ End of multiplication
  add r7, r7, #1 @ k++
  b for_k
end_for_k:
  add r6, r6, #1 @ j++
  b for_j
end_for_j:
  add r5, r5, #1 @ i++
  b for_i
end_for_i:
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
  ldmfd sp!, {r0-r12, lr}
@ return
  bx lr
@ h__a: .word height1
@ w__a: .word width1
f__i:     .word formati
f__j:     .word formatj
f__k:     .word formatk
.data
formati:  .asciz "from assembly: i %d\n"
formatj:  .asciz "from assembly: j %d\n"
formatk:  .asciz "from assembly: k %d\n"
