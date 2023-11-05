.text
.align 2
.global matmul
.type matmul, %function

matmul:
@ str lr, [sp, #-4]!
  mov r4, lr
@ sub sp, sp, #8
@ stmia sp!, {r0, r1}
  str r0, [sp, #-4]! @ Stack: r0
  str r1, [sp, #-4]! @ Stack: r0, r1

  ldr r0, f__a @ load format string into r0
  ldr r1, [sp, #4]! @ load original r1 into r1
@ Stack: r0
  bl printf

  ldr r0, f__a @ load format string into r0
  ldr r1, [sp, #4]! @ load original r0 into r1
@ Stack: -
  bl printf

  ldr r0, f__a @ load format string into r0
  ldr r1, [sp, #4]! @ load original r0 into r1
@ Stack: -
  bl printf
@ ldrfd sp!, {r1}
@ bl printf
@ ldmfd sp!, {lr}
// return
  mov lr, r4
  bx lr
@ h__a: .word height1
@ w__a: .word width1
f__a:   .word format
.data
format: .asciz "from assembly, %d\n"
