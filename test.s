.data
print_array:
.string "%d\n"

print_b:
.string "b=3\n"

print_less:
.string "Summ of lesser elements: %d\n"

print_gr:
.string "Summ of greater elements: %d\n"

array:
.long 1, 2, 3, 4, 5
array_end:

.text
.global main
.type main, @function

main:
movl $0, %ecx /* summ of less */
movl $0, %edx /* summ of greater */
movl $3, %esi /* b */
/*pushl (%esi)*/
pushl $print_b 
call printf 
addl $8, %esp

movl $array, %ebx 
movl (%ebx), %eax 

loop_start:
movl (%ebx), %eax 
pushl (%ebx)
pushl $print_array
call printf
addl $8, %esp

cmpl (%esi), %eax 
jl less 
add (%ebx), %edx 
jmp next

less:
add (%ebx), %ecx 
jmp next 

next:
addl $4, %ebx 
movl (%ebx), %eax

ch_bound:
cmpl $array_end, %ebx 
jne loop_start

pushl (%ecx)
pushl $print_less
call printf
addl $8, %esp

pushl (%edx)
pushl $print_gr
call printf
addl $8, %esp

movl $0, %esi
movl $0, %edx
movl $0, %ecx
movl $0, %ebx
movl $0, %eax

