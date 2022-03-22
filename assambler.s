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
pushl $print_b
call printf
addl $4, %esp

movl $array, %ebx
movl (%ebx), %eax
jmp ch_bound

loop_start:
pushl (%ebx)
pushl $print_array
call printf
addl $8, %esp

addl $4, %ebx
movl (%ebx), %eax

ch_bound:
cmpl $array_end, %ebx
cmpl $array_end, %ebx
jne loop_start
movl $array, %ebx
movl $0, %edx

ifs_start:
movl (%ebx), %eax
cmpl $3, %eax
jle less
add (%ebx), %edx
jmp next

less:
cmpl $3, %eax
je next
addl %eax, %ecx

next:
addl $4, %ebx
movl (%ebx), %eax
cmpl $array_end, %ebx
jne ifs_start
pushl %edx

pushl %ecx
pushl $print_less
call printf
addl $12, %esp

movl -4(%esp), %edx
pushl %edx
pushl $print_gr
call printf
addl $8, %esp

movl $0, %edx
movl $0, %ecx
movl $0, %ebx
movl $0, %eax
