//В числе Х обнулить шесть младших разрядов; если в результате получилось число 256, вывести «да».
.global _main
.align 2
_main:
    mov x0, #310 //число
    lsr x1, x0, #6 //сдвиг вправо на 6 (удаляем 6 младший бит)
    lsl x1, x1, #6 //сдвиг влево на 6 (обнуляем 6 разрядов)

    //проверяем равен ли результат 256
    mov x2, #256
    cmp x1, x2 //сравниваем
    b.eq output_yes//если равно, то переходим к метке вывода

    b output_no

output_yes:
    adr x0, mess_output_yes
    bl _printf
    mov x0, #1
    mov x16, #1
    svc #0x80

output_no:
    mov x0, #1
    mov x16, #1
    svc #0x80

mess_output_yes:
    .asciz "Да\n"
