org 100h
ld DE,text1
ld DE,text2
call 5
text1: db "Yo sup!",13,10,"$"
text2: db "sup?",13,10,"$"
ld c,9
ld de,hello2
call 5
RET


printstring: ld A,[HL]        ;Input: HL = pointer to string
CP "$"
RET Z
LD E,A
LD C,2                        ;Conout
PUSH HL                       ;Protect, because we care about them <3
CALL BDOS
POP HL                        ;Retrive them from stack
INCL HL                       ;Lets get the next one
JP printstring                ;Lets roll again!
