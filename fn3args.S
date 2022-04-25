.global fn3args
fn3args:
  cmpl $0, (%rdi)             # 0 > arr[0]
  js .L1                      # true
  cmpl $0, 4(%rdi)            # 0 > arr[1]
  js .L1                      # true
  cmpl $0, 8(%rdi)            # 0 > arr[2]
  js .L1                      # true

  # eax = quotient
  # edx = remainder

  movl $0, %edx               # 0 = edx (clearing)
  movl (%rdi), %eax           # arg[0] = eax
  imull 4(%rdi), %eax         # arg[0] * arg[1] = eax
  imull 8(%rdi), %eax         # arg[0] * arg[1] * arg[2] = eax
  movl $3, %r10d              # 3 = r10d
  div %r10d                   # (arg[0] * arg[1] * arg[2]) % 3 = eax 
                              # (arg[0] * arg[1] * arg[2]) % 3 = edx
  cmpl $0, %edx               # 0 < edx (remainder)
  jl .L2
  retq

.L1:
  movl $0xBAAAAAAD, %eax      # BAAAAAAD = eax
  retq

.L2:
  addl $1, %eax               # ((arg[0] * arg[1] * arg[2])/3) + 1 = eax
  retq
