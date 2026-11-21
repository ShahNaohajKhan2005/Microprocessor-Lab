.MODEL SMALL
.STACK 100h

.DATA
    numA        DB 5
    numB        DB 3
    labelA      DB 'A = $'
    labelB      DB '    B = $'
    exchangeMsg DB 0Dh, 0Ah, 'After exchange', 0Dh, 0Ah, '$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Print the original values
    CALL PRINT_VALUES

    ; Exchange A and B
    MOV AL, numA
    MOV BL, numB
    XCHG AL, BL
    MOV numA, AL
    MOV numB, BL

    ; Print the heading and the exchanged values
    LEA DX, exchangeMsg
    MOV AH, 09h
    INT 21h
    CALL PRINT_VALUES

    MOV AX, 4C00h
    INT 21h
MAIN ENDP

PRINT_VALUES PROC
    LEA DX, labelA
    MOV AH, 09h
    INT 21h

    MOV DL, numA
    ADD DL, 30h
    MOV AH, 02h
    INT 21h

    LEA DX, labelB
    MOV AH, 09h
    INT 21h

    MOV DL, numB
    ADD DL, 30h
    MOV AH, 02h
    INT 21h

    RET
PRINT_VALUES ENDP

END MAIN