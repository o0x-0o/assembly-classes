segment .data
        LF                  equ 0xA  ; Line feed
        NULL                equ 0x0  ; final da string
        SYS_EXIT            equ 0x1  ; codigo de chamada para finalizar o programa
        RET_EXIT            equ 0x0  ; retorno 0 de sucesso para saida
        SYS_WRITE           equ 0x4  ; operacao de escrita
        SYS_READ            equ 0x3  ; operacao de leitura
        STD_OUT             equ 0x1  ; saida padrao
        STD_IN              equ 0x0  ; entrada padrao
        SYS_CALL            equ 0x80 ; chamada do sistema

section .data
        msg                db "Entre com seu nome:", LF, NULL
        tam                equ $- msg

section .bss
        nome                resb 1

section .text

global _start

_start:
        mov                eax, SYS_WRITE
        mov                ebx, STD_OUT
        mov                ecx, msg
        mov                edx, tam
        int                SYS_CALL

        mov                eax, SYS_READ
        mov                ebx, STD_IN
        mov                ecx, nome
        mov                edx, 0xA
        int                SYS_CALL

        mov                eax, SYS_EXIT
        mov                ebx, RET_EXIT
        int                SYS_CALL
        