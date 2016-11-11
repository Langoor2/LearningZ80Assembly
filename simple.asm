BDOS: EQU 5
org 100h
LD HL,TextInput
LD HL,text1
Call printstring
LD HL,text2
Call printstring
LD HL,TextInput
LD B,7
;7 character text input
.loop:
  PUSH BC
  LD C,8
  CALL BDOS
  LD [HL],A
  INC HL
  POP BC
djnz .loop

RET

TextInput: db 0
text1: db "Yo sup!",13,10,"$"
text2: db "sup?",13,10,"$"
;Input: HL = pointer to string
printstring: ld A,[HL]

CP "$"
RET Z
LD E,A
LD C,2                        ;Conout
PUSH HL                       ;Protect, because we care about them <3
CALL BDOS
POP HL                        ;Retrive them from stack
INC HL                        ;Lets get the next one
JP printstring                ;Lets roll again!
