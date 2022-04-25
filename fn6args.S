.global fn6args
fn6args:
  # distance = ((x2-x1)^2 + (y2-y1)^2 + (z2-z1)^2)^(1/2)
  # x1 = edi, y1 = esi, z1 = edx, x2 = ecx, y2 = r8d, z2 = r9d

  # Getting the value of (x2-x1)^2
  movl %ecx, %r10d      # x2 = r10d
  subl %edi, %r10d      # x2-x1 = r10d
  imull %r10d, %r10d    # (x2-x1)^2 = r10d

  # Getting the value of (y2-y1)^2 and (z2-z1)^2 - using temp vars. 
  movl %r8d, %ebx       # y2 = ebx
  subl %esi, %ebx       # y2-y1 = ebx
  imull %ebx, %ebx      # (y2-y1)^2 = ebx
  addl %ebx, %r10d      # (x2-x1)^2 + (y2-y1)^2 = r10d

  movl %r9d, %ebx       # z2 = ebx
  subl %edx, %ebx       # z2-z1 = ebx
  imull %ebx, %ebx      # (z2-z1)^2 = ebx
  addl %ebx, %r10d      # (x2-x1)^2 + (y2-y1)^2 + (z2-z1)^2 = r10d

  # Calling integer_sqrt
  call integer_sqrt
  retq

integer_sqrt: 
    pushq %rbx          # pushing function to stack
    movl %r10d, %r11d   # (x2-x1)^2 + (y2-y1)^2 + (z2-z1)^2 = r11d (Parameter N)
    
    cmpl $2, %r10d      # 2 > r10d
    js .L1              # true

    shrl $2, %r10d      # n >> 2
    call integer_sqrt   # integer_sqrt(n >> 2)
    sall $1, %r10d      # integer_sqrt(n >> 2) << 1

    movl %r10d, %r12d   # small_cand = r10
    addl $1, %r12d      # large_cand = r12d
    movl %r12d, %r13d   # large_cand = r13d

    imull %r13d, %r13d  # large_cand * large_cand = r13d

    # n = r11d

    cmpl %r13d, %r11d   # large_cand * large_cand > n
    js .L2

    movl %r11d, %eax     # small_cand = eax
    popq %rbx            # pop stack
    retq

.L1: 
  popq %rbx              # popping function
  retq
  
.L2:
  movl %r12d, %eax       # large_cand -> eax
  popq %rbx              # pop stack
  retq
