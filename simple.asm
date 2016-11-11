org 100h
ld c,9
ld de,hello
ld A,[HL]
call 5
hello: db "yo sup",13,10,"$"
ld c,9
ld de,hello2
call 5
RET
hello2: db "hoi",13,10,"$"
