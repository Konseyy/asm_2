.text
.align 2
.global matmul
.type matmul, %function

matmul:
  ldr r0, f__1a
  ldr r1, [sp, #0]
  bl printf
  str lr, [sp, #-4]! @ Stack: sp -> lr
@ sub sp, sp, #8
@ stmia sp!, {r0, r1}
  str r1, [sp, #-4]! @ Stack: sp -> r1, lr
  str r0, [sp, #-4]! @ Stack: sp -> r0, r1, lr

  ldr r0, f__1a @ load format string into r0
  ldr r1, [sp, #0]@ load original ro (first arg) into r1
@ Stack: sp -> r0, r1, lr
  bl printf

  ldr r0, f__2a @ load format string into r0
  ldr r1, [sp, #4]! @ load original r1 (second arg) into r1
@ Stack: sp -> r1, lr
  bl printf

  ldr lr, [sp, #4]! @ load original r0 into r1
@ Stack: sp -> lr
  add sp, sp, #4 @ Stack: sp ->
@ return
  bx lr
@ h__a: .word height1
@ w__a: .word width1
f__1a:    .word format1
f__2a:    .word format2
.data
format1:  .asciz "from assembly H: %d\n"
format2:  .asciz "from assembly W: %d\n"
