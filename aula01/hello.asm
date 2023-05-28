section .data
        msg db "Hewwo World! "
            db "UwU", 0xa
        tam equ $- msg

section .text

global _start

_start:
        mov eax, 0x4
        mov ebx, 0x1
        mov ecx, msg
        mov edx, tam
        int 0x80

saida:
        mov eax, 0x1
        mov ebx, 0x0
        int 0x80