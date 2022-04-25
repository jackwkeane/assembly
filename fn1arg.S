.global fn1arg  # makes fn1arg visible to the linker (ld)
fn1arg:
  negl %edi        # negate first and only argument
  movl %edi, %eax  # move negated value into result register
  retq

