org 100h
ld c,9
ld DE,text2
call 5
ld c,9
ld de,text1
call 5
RET

text1: db "Yo sup!",13,10,"$"
text2: db "sup?",13,10,"$"
printstring: ld A,[HL]        ;Input: HL = pointer to string
CP "$"
RET Z
LD E,A
LD C,2                        ;Conout
PUSH HL                       ;Protect, because we care about them <3
CALL BDOS
POP HL                        ;Retrive them from stack
INC HL                       ;Lets get the next one
JP printstring                ;Lets roll again!
