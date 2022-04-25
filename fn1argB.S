.global fn1argB  # makes fn1arg visible to the linker (ld)
fn1argB:
  subl $1, %edi               # (edi - 1) -> edi
  cmpl $0, %edi               # 0 > edi 
  js .L1                      # true
  
  movl %edi, %eax             # edi -> eax       
  retq

.L1:
  movl $0xDEADBEEF, %eax      # DEADBEEF -> eax
  retq
