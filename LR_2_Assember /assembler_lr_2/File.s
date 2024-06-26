.global _main
.align 2

_main:
    mov X1, #-17 //Ввод B
    mov X2, #5 //Ввод A
    mov X3, #-1 //Ввод C
    mov X5, #4
    
    mul X1, X1, X1 // B = B * B возводим в квадрат
    mul X2, X2, X3 //A * C
    mul X2, X5, X2 // 4*A*C
    
    SUBS X4, X1, X2 //D = B^2 - 4*A*C

    str X4, [sp] //сохраняем D в стековый регистр
    adr X0, output_str //загружаем адрес строки в X0
    bl _printf //С-функция вывода

    // проверяем условие CS - установлен флаг переноса C
    b.cs carry_set // если флаг установлен - переход к метке carry
    mov x0, 1 // если флаг не установлен, Х0=1
    b exit
carry_set:
    mov x0, 2 // если флаг установлен, Х0=2
exit:
    mov X16, #1 //системный вызов 1 завершает программу
    svc #0x80 //завершаем системную функцию с номером 1

    //вывод результата в консоль
    output_str:
        .asciz "ОТВЕТ:\nD = %d\n"
