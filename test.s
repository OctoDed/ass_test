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

movl $array, %ebx /* адрес текущего элемента */
movl (%ebx), %eax /* значение текущего элемента */
jmp ch_bound

loop_start:
movl (%ebx), %eax /* вывод массива */
pushl (%ebx)
pushl $print_array
call printf
addl $8, %esp

cmpl $3, %eax 
jl less 
addl (%ebx), %edx /* найден больший эл. */
jmp next

less:
addl (%ebx), %ecx /* найден меньший эл. */
jmp next 

next: /* след. элемент */
addl $4, %ebx 
movl (%ebx), %eax

ch_bound: /* проверка на конец массива */
cmpl $array_end, %ebx 
jne loop_start

pushl (%ecx) /* вывод sum_less */
pushl $print_less
call printf
addl $8, %esp

pushl (%edx) /* вывод sum_gr */
pushl $print_gr
call printf
addl $8, %esp

movl $0, %edx
movl $0, %ecx
movl $0, %ebx
movl $0, %eax
