BDOS: EQU 5
org 100h
LD HL,text1
Call printstring
LD HL,text2
Call printstring
LD HL,TextInput
LD B,7
LD HL,TextInput
;7 character text input
.loop:
  PUSH BC     ;Put BC in live-support
  LD C,8
  PUSH HL     ;Put HL in Live-support
  CALL BDOS
  POP HL      ;Get HL from Live-support
  LD [HL],A
  INC HL
  POP BC      ;Retrive BC from live-support
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
