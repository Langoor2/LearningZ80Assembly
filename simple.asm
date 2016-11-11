org 100h
LD HL,text1
Call printstring
LD HL,text2
Call printstring
call 5
RET

text1: db "Yo sup!",13,10,"$"
text2: db "sup?",13,10,"$"
;Input: HL = pointer to string
printstring: ld A,[HL]
BDOS: EQU 5
CP "$"
RET Z
LD E,A
LD C,2                        ;Conout
PUSH HL                       ;Protect, because we care about them <3
CALL BDOS
POP HL                        ;Retrive them from stack
INC HL                       ;Lets get the next one
JP printstring                ;Lets roll again!
