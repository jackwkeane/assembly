.global fn2args
fn2args:
  movl (%rdi), %ebx             # edx = di
  cmpl %ebx, (%rsi)             # edi > esi  
  jl .L1                        # true
  retq

.L1: 
  movl (%rdi), %eax             #  t0 = *xp
  movl (%rsi), %ebx             #  t1 = *yp
  movl %ebx, (%rdi)             #  *xp = t1
  movl %eax, (%rsi)             #  *yp = t1
  retq

  

