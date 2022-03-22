.data
print_array:
.string "%d\n"

print_b:
.string "b=3\n"

print_less:
.string "Quantity of lesser elements: %d\n"

print_gr:
.string "Summ of greater elements: %d\n"

array:
.long 1, 2, 3, 4, 5
array_end:

.text
.global main
.type main, @function

main:
movl $0, %ecx /* quan of less */
movl $0, %edx /* summ of greater */
pushl $print_b
call printf
addl $4, %esp

movl $array, %ebx /* адрес текущего элемента */
movl (%ebx), %eax /* значение текущего элемента */
jmp ch_bound

loop_start:
pushl (%ebx)
pushl $print_array /* вывод массива */
call printf
addl $8, %esp

addl $4, %ebx
movl (%ebx), %eax

ch_bound: /* проверка на конец массива */
cmpl $array_end, %ebx
cmpl $array_end, %ebx
jne loop_start
movl $array, %ebx
movl $0, %edx

ifs_start: /* сравнене данных */
movl (%ebx), %eax
cmpl $3, %eax
jle less
add (%ebx), %edx /*если больше, то суммируем */
jmp next

less:
cmpl $3, %eax /* если равно b, то пропускаем */
je next
addl $1, %ecx /* если меньше, то инкримент кол-ва */

next:
addl $4, %ebx /* переход на след. эл. массива */
movl (%ebx), %eax
cmpl $array_end, %ebx
jne ifs_start
pushl %edx

pushl %ecx /* вывод кол-ва меньших */
pushl $print_less
call printf
addl $12, %esp

movl -4(%esp), %edx
pushl %edx /* вывод суммы больших */
pushl $print_gr
call printf
addl $8, %esp

movl $0, %edx
movl $0, %ecx
movl $0, %ebx
movl $0, %eax
