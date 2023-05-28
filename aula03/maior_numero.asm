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
        x                dd 10
        y                dd 50
        msg1             db "X maior que Y", LF, NULL
        tam1             equ $- msg1
        msg2             db "Y maior que X", LF, NULL
        tam2             equ $- msg2
        msg3             db "X igual a Y", LF, NULL
        tam3             equ $- msg3

section .text

global _start

_start:
        ; carrega os valores x e y nos registradores
        mov                eax, DWORD[x]
        mov                ebx, DWORD[y]

        ; comparacao
        cmp                eax, ebx
        je                 igual
        jg                 xmaior
        jl                 xmenor

xmaior: mov                ecx, msg1
        mov                edx, tam1
        jmp                saida

xmenor: mov                ecx, msg2
        mov                edx, tam2
        jmp                saida

igual:  mov                ecx, msg3
        mov                edx, tam3

saida:  mov                eax, SYS_WRITE
        mov                ebx, STD_OUT
        int                SYS_CALL

        mov                eax, SYS_EXIT
        mov                ebx, RET_EXIT
        int                SYS_CALL