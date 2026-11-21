.MODEL SMALL
.STACK 100h
.DATA
    num db 5
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AL, num
    DEC AL
    MOV num, AL

    ADD AL, 30h
    MOV DL, AL
    MOV AH, 2
    INT 21h

    MOV AH, 4Ch
    INT 21h
MAIN ENDP
END MAIN