;INTEGRANTES DO GRUPO: JOÃO VICTOR MINELLI, JÚLIA CARRIEL PEREIRA E MARIA EDUARDA ANDRADE
TITLE PROJETO FINAL AULA PRÁTICA ASSEMBLY
.model small
.stack 100h
;macro para pular linha ao longo do código
pula_linha macro
    PUSH AX
    PUSH DX
    MOV AH,02
    MOV DL,10
    INT 21H
    POP DX
    POP AX
endm
;macro para dar espaço entre os digitos impressos da matriz do usuário
espaco MACRO
    PUSH AX
    PUSH DX
    MOV AH,2             
    MOV DL,32
    INT 21H
    POP DX
    POP AX
ENDM
.DATA
;matriz do usuário
MATRIZU DB 10 DUP (30H)
        DB 10 DUP (30H)
        DB 10 DUP (30H)
        DB 10 DUP (30H)
        DB 10 DUP (30H)
        DB 10 DUP (30H)
        DB 10 DUP (30H)
        DB 10 DUP (30H)
        DB 10 DUP (30H)
        DB 10 DUP (30H)

;matriz 0
MATRIZ0 DB 30H,30H,30H,30H,30H,31H,31H,31H,31H,30H
        DB 31H,31H,31H,30H,30H,30H,30H,30H,30H,30H
        DB 4 DUP (30H), 31H, 5 DUP (30H)
        DB 3 DUP (30H), 2 DUP (31H), 3 DUP (30H), 31H, 30H
        DB 4 DUP (30H), 31H, 2 DUP (30H), 3 DUP (31H)
        DB 30H, 31H, 8 DUP (30H)
        DB 30H, 31H, 8 DUP (30H)
        DB 10 DUP (30H)
        DB 4 DUP (30H), 2 DUP (31H), 4 DUP (30H)
        DB 10 DUP (30H)

;matriz 1
MATRIZ1 DB 2 DUP (31H), 3 DUP (30H), 31H, 4 DUP (30H)
        DB 4 DUP (30H), 3 DUP (31H), 30H, 2 DUP (31H)
        DB 3 DUP (31H), 7 DUP (30H)
        DB 30H, 31H, 2 DUP (30H), 31H , 5 DUP (30H)
        DB 4 DUP (30H), 31H, 5 DUP (30H)
        DB 4 DUP (30H),31H,5 DUP (30H)
        DB 31H, 3 DUP (30H),31H,5 DUP (30H)
        DB 31H, 9 DUP (30H)
        DB 31H, 9 DUP (30H)
        DB 10 DUP (30H)

;matriz 2
MATRIZ2 DB 10 DUP (30H)
        DB 30H,31H, 6 DUP (30H),31H,30H
        DB 30H,31H, 6 DUP (30H),31H,30H
        DB 10 DUP (30H)
        DB 4 DUP (30H),31H,30H,31H, 3 DUP (30H)
        DB 3 DUP (30H), 2 DUP (31H),30H,2 DUP (31H), 2 DUP (30H)
        DB 4 DUP (30H),31H,30H,31H, 3 DUP (30H)
        DB 10 DUP (30H)
        DB 4 DUP (31H), 6 DUP (30H)
        DB 6 DUP (30H), 3 DUP (31H), 30H

;matriz 3
MATRIZ3 DB 10 DUP (30H)
        DB 31H,2 DUP (31H), 4 DUP (30H), 2 DUP (31H),30H
        DB 10 DUP (30H)
        DB 30H, 3 DUP (31H),3 DUP (30H),31H,2 DUP (30H)
        DB 2 DUP (30H),31H,3 DUP (30H),3 DUP (31H),30H
        DB 10 DUP (30H)
        DB 3 DUP (30H), 4 DUP (31H), 3 DUP (30H)
        DB 10 DUP (30H)
        DB 4 DUP (30H),3 DUP (31H),3 DUP (30H)
        DB 10 DUP (30H)

;matriz escolhida, quando o usuário digita um numero, pegamos o ultimo numero digitado, dividimos por 3 e o resultado da divisão corresponde a
;matriz 0, 1, 2 ou 3, que passamos para a matriz escolhida para operar o jogo diretamente com a matriz escolhida
MATRIZE DB 10 DUP (30H)
        DB 10 DUP (30H)
        DB 10 DUP (30H)
        DB 10 DUP (30H)
        DB 10 DUP (30H)
        DB 10 DUP (30H)
        DB 10 DUP (30H)
        DB 10 DUP (30H)
        DB 10 DUP (30H)
        DB 10 DUP (30H)

;mensagens de boas vindas e instruções ao usuário
BEMVINDO DB "        SEJA BEM VINDO!$"
COMOFUNCIONA DB "-> O jogo consiste em batalha naval, onde voce ganha quando encontrar todas as$"
COMOFUNCIONA2 DB "   embarcacoes existentes$"
COMOFUNCIONA3 DB "-> Quando voce acerta uma posicao, a posicao aparece como ! e quando voce erra,$"
COMOFUNCIONA4 DB "  aparece como X$"
EMBARCACOES DB "-> As embarcacoes presentes sao: 2 submarinos (cada um ocupa 2 posicoes),$"
EMBARCACOES2 DB "  2 hidroavioes (cada um ocupa 4 posicoes), 1 fragata (que ocupa 3 posicoes) $"
EMBARCACOES3 DB "  e 1 encouracado (que ocupa 4 posicoes)$"
SAIR DB "        Caso voce queira desistir, pressione ESC$"
NUMERO DB "INSIRA UM NUMERO PARA INICIAR O JOGO:$"
COLUNA DB "INSIRA O NUMERO DA COLUNA (DE 0 A 9):$"
LINHA DB "INSIRA O NUMERO DA LINHA (DE 0 A 9):$"
DESISTIU DB "        QUE PENA, VOCE DESISTIU! BOA SORTE NA PROXIMA!$"
ERRO2 DB "        VOCE DESRESPEITOU AS REGRAS, USE APENAS DE 0 A 9$"
GANHOU DB "        PARABENS, VOCE GANHOU!$"

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    XOR BX,BX
    XOR SI,SI
    ;AX guarda a quantidade de posições que o usuário deve acertar
    MOV AX,19
    PUSH AX
    ;entra no procedimento apresentação, no qual imprime as mensagens de boas vindas e instruções e passa a matriz correspondente ao resultado 
    ;da divisão do número digitado por 3 para a MATRIZE
    CALL APRESENTACAO

    ;imprime a matriz do usuário
    COMECO:
        pula_linha
        XOR BX,BX
        XOR SI,SI
        MOV CX,10
        MOV AH,2

    IMPRIMIR:
        espaco
        MOV DL, MATRIZU[BX][SI]
        INT 21H
        INC SI
    LOOP IMPRIMIR

    ADD BX,10
    XOR SI,SI
    pula_linha
    MOV CX,10
    CMP BX,100
    JNE IMPRIMIR
    
    ;retira o número de posições a serem acertadas da pilha para conferir se é 0, pois se for, vai para GANHO (que imprime a mensagem que ganhou
    ;e finaliza o programa)
    POP AX
    CMP AX,0
    JE GANHO
    PUSH AX
    
    ;imprime para o usuário a mensagem pedindo a coluna desejada, lê o que o usuário digitou, se for esc (1Bh), vai para DESISTIR (que imprime 
    ;uma mensagem de desistência e finaliza o programa), e vai para VERIFICARC (onde confere se o caractere está entre 30h-39h)
    ;se não estiver, vai para ERROCL (onde chama o procedimento ERRO, que imprime uma mensagem de desrespeito as regras e volta para COMEÇO para
    ;imprimir a matriz anterior ao desrespeito da regra e segue com o jogo) e se estiver entre 0-9, volta para COLUNAV, que transforma o caracter 
    ;em numero e move para SI
    pula_linha
    MOV AH,9
    LEA DX, COLUNA
    INT 21H

    MOV AH,1
    INT 21H
    
    CMP AL, 1BH
    JE DESISTIR
    JMP VERIFICARC

    COLUNAV:
        XOR AH,AH
        AND AL,0FH
        MOV SI,AX

    ;imprime para o usuário a mensagem pedindo a linha desejada, lê o que o usuário digitou, se for esc (1Bh), vai para DESISTIR (que imprime 
    ;uma mensagem de desistência e finaliza o programa), e vai para VERIFICARL (onde confere se o caracter está entre 30h-39h
    ;se não estiver, vai para ERROCL (onde chama o procedimento ERRO, que imprime uma mensagem de desrespeito as regras e volta para COMEÇO para
    ;imprimir a matriz anterior ao desrespeito da regra e segue com o jogo) e se estiver entre 0-9, volta para LINHAV, que transforma o caracter 
    ;em numero, multiplica por 10 e move para BX
    pula_linha
    MOV AH,9
    LEA DX, LINHA
    INT 21H

    MOV AH,1
    INT 21H

    CMP AL, 1BH
    JE DESISTIR
    JMP VERIFICARL
    pula_linha
    
    LINHAV:
        XOR AH,AH
        AND AL,0FH
        MOV BX,10
        MUL BX
        MOV BX,AX

    ;compara a coluna e linha digitadas com o que há na MATRIZE. Se tiver 31h nessa posição, o usuário acertou uma posição em que há embarcação,
    ;então vai para ACERTOU onde compara se já havia '!' (21h) na MATRIZU pois se tinha,
    ;o usuário já tinha acertado essa posição e vai para PULO (que vai para COMEÇO, assim para imprimir a matriz sem alterações)
    ;se não tiver '!' (21h) na coluna e linha da matriz do usuário, tira o numero de acertos da pilha, decrementa 1, guarda o número e move '!'  
    ;para a posição na MATRIZU (que é a impressa para o usuário).
    ;se não tiver 31h na coluna e linha da MATRIZE, move 'X'(58h) para a coluna e linha escolhidas na matriz do usuário pois ele não acertou embarcação
    MOV AH,MATRIZE[BX][SI]
    CMP AH,31H
    JE ACERTOU
    
    ERROU:
        MOV MATRIZU[BX][SI], 58h
        JMP COMECO
    
    ACERTOU:
        CMP MATRIZU[BX][SI], 21h
        JE PULO
        MOV MATRIZU[BX][SI], 21h
        POP AX
        DEC AX
        PUSH AX

    PULO:
        JMP COMECO
    
    ;GANHO: quando o número retirado da pilha após a impressão da matriz é 0, imprime a mensagem de ganhou para o usuário e vai para FIM (que finaliza o programa)
    ;DESISTIR: quando o usuário digita ESC, imprime a mensagem de desistiu e vai para FIM (que finaliza o programa)
    ;VERIFICARC: verifica se o caracter digitado para coluna está entre 0-9, se estiver vai para LINHAC (que segue com o jogo CONSIDERANDO 
    ;o numero digitado pelo usuário), se não estiver vai para ERROCL (que chama o procedimento ERRO, onde é impressa a mensagem de desrespeito 
    ;as regras, e vai para COMECO, onde imprime a ultima matriz gerada antes do usuário desrespeitar e segue com o jogo solicitando um novo número para a coluna
    ;VERIFICARL: verifica se o caracter digitado para linha está entre 0-9, se estiver vai para LINHAV (que segue com o jogo CONSIDERANDO 
    ;o numero digitado pelo usuário), se não estiver vai para ERROCL (que chama o procedimento ERRO, onde é impressa a mensagem de desrespeito 
    ;as regras, e vai para COMECO, onde imprime a ultima matriz gerada antes do usuário desrespeitar e segue com o jogo solicitando um novo número para a coluna
    ;ou seja, quando digita algo que não esteja entre 0-9, avisa o usuário sobre o desrespeito e "desconsidera" o que foi digitado para seguir com o jogo 
    GANHO:
        pula_linha
        MOV AH,9
        LEA DX, GANHOU
        INT 21H
        JMP FIM

    DESISTIR:
        pula_linha
        MOV AH,9
        LEA DX,DESISTIU
        INT 21H
        JMP FIM

    VERIFICARC:
        CMP AL,39H
        JA ERROCL
        CMP AL,30H
        JB ERROCL
        JMP COLUNAV

    VERIFICARL:
        CMP AL,39H
        JA ERROCL
        CMP AL,30H
        JB ERROCL
        JMP LINHAV

    ERROCL:
        CALL ERRO
        JMP COMECO

    FIM:
        MOV AH,4CH
        INT 21H
MAIN ENDP

;procedimento responsável por imprimir a mensagem de desrespeito as regras quando é digitado algo que não esteja entre 0-9
ERRO PROC
        pula_linha
        MOV AH,9
        LEA DX, ERRO2
        INT 21H
        RET
ERRO ENDP

APRESENTACAO PROC
    ;imprime as mensagens de boas vindas ao usuario e as instruções sobre o funcionamento do jogo
    MOV AH,9
    LEA DX, BEMVINDO
    INT 21H
    pula_linha
    pula_linha
    LEA DX, COMOFUNCIONA
    INT 21H
    pula_linha
    LEA DX, COMOFUNCIONA2
    INT 21H
    pula_linha
    pula_linha
    LEA DX, COMOFUNCIONA3
    INT 21H
    pula_linha
    LEA DX, COMOFUNCIONA4
    INT 21H
    pula_linha
    pula_linha
    LEA DX, EMBARCACOES
    INT 21H
    pula_linha
    LEA DX, EMBARCACOES2
    INT 21H
    pula_linha
    LEA DX, EMBARCACOES3
    INT 21H
    pula_linha
    pula_linha
    LEA DX, SAIR
    INT 21H
    pula_linha
    pula_linha

    ;imprime a mensagem solicitando que o usuario digite um numero
    LERV:
        LEA DX,NUMERO
        INT 21H

    ;le o numero inserido enquanto o usuário não digitar enter (0Dh), move para bl e transforma em caracter
    ;caso digite ESC (1Bh), vai para DESISTIU2 (em que imprime a mensagem de desistencia e finaliza o programa)
    ;caso digite um caracter que não esteja entre 0 a 9, vai para ERRON (que chama o procedimento erro, onde imprime a mensagem de desrespeito 
    ;as regras, e vai para LERV para novamente imprimir a mensagem solicitando um número e continuar o programa)
    ;quando digita enter, vai para escolha, onde o último número digitado é dividido por 3 e passa para a MATRIZE a matriz 
    ;correspondente ao resultado para que, no programa principal, o jogo seja realizado entre a MATRIZE e a MATRIZU
    ;ex. se o ultimo numero digitado foi 3, irá passar a MATRIZ1 para a MATRIZE 
    MOV AH, 1 
    LER:
        INT 21H
        CMP AL,0DH
        JE ESCOLHA
        CMP AL,1BH 
        JE DESISTIU2
        CMP AL,39H
        JA ERRON
        CMP AL,30H
        JB ERRON       
        MOV BL,AL 
        AND BL,0FH
        JMP LER 

    ERRON:
        CALL ERRO
        pula_linha
        JMP LERV

    DESISTIU2:
        pula_linha
        MOV AH,9
        LEA DX,DESISTIU
        INT 21H

    FIMP:
        MOV AH,4CH
        INT 21H

    ESCOLHA:
        XOR AX,AX 
        MOV AL, BL 
        MOV BL,3
        DIV BL 

    ;compara o resultado da conta (al) com os possíveis resultados para passar a matriz correspondente (0,1,2 e 3) a matriz escolhida
    ;(que de inicio é uma matriz zerada)
    CMP AL,0 
    JE M0
    CMP AL,1 
    JE M1
    CMP AL,2 
    JE M2
    CMP AL,3
    JE M3


    ;de M0 a M3 o programa passa a matriz correspondente ao resultado para a matriz escolhida para no programa principal realizar 
    ;o jogo entre a matriz escolhida (MATRIZE) e a do usuário (MATRIZU)
    M0:
        XOR BX,BX 
        MOV CX,10 

        PASSAR0:
            MOV AL, MATRIZ0[BX][SI] 
            MOV MATRIZE[BX][SI], AL
            INC SI
        LOOP PASSAR0

        ADD BX,10
        XOR SI,SI
        MOV CX,10
        CMP BX,100
        JNE PASSAR0
        
        RET

    M1:
        XOR BX,BX
        MOV CX,10
        
        PASSAR1:
            MOV AL, MATRIZ1[BX][SI]
            MOV MATRIZE[BX][SI], AL
            INC SI
        LOOP PASSAR1

        ADD BX,10
        XOR SI,SI
        MOV CX,10
        CMP BX,100
        JNE PASSAR1
        
        RET

    M2:
        XOR BX,BX
        MOV CX,10

        PASSAR2:
            MOV AL, MATRIZ2[BX][SI]
            MOV MATRIZE[BX][SI], AL
            INC SI
        LOOP PASSAR2

        ADD BX,10
        XOR SI,SI
        MOV CX,10
        CMP BX,100
        JNE PASSAR2

        RET

    M3:
        XOR BX,BX
        MOV CX,10

        PASSAR3:
            MOV AL, MATRIZ3[BX][SI]
            MOV MATRIZE[BX][SI], AL
            INC SI
        LOOP PASSAR3

        ADD BX,10
        XOR SI,SI
        MOV CX,10
        CMP BX,100
        JNE PASSAR3

        RET

    APRESENTACAO ENDP
END MAIN