Org #A000
start
LD    A,#40
CALL  #BC08
LD    A,#01
CALL  #BC0E
LD    A,#01
CALL  #BB63
LD    BC,#0000
CALL  #BC38
LD    BC,#0000
XOR   A
CALL  #BC32
LD    BC,#1818
LD    A,#01
CALL  #BC32
LD    BC,#0606
LD    A,#03
CALL  #BC32
CALL  #BBBA
LD    A,#03
CALL  #BC59
LD    DE,#0002
LD    HL,#0183
CALL  #BBC0
LD    A,#03
CALL  #BBDE
LD    HL,#A100
LD    A,(HL)
INC   HL
OR    A
JR    Z,#A04F
CALL  #BB5A
JR    #A045
LD    DE,#0000
LD    HL,#0185
CALL  #BBC0
LD    A,#01
CALL  #BBDE
LD    HL,#A100
LD    A,(HL)
INC   HL
OR    A
JR    Z,#A06A
CALL  #BB5A
JR    #A060
XOR   A
CALL  #BC59
LD    DE,#0000
LD    HL,#013F

;Ecran en #4000
;Mode 1
;Border noir 
;Fond noir 
;Ecriture jaune
;Couleur rouge
;GRA INITIALISE
;Superposition
;Place curseur
;Couleur rouge
;Message 
;Place curseur
;Couleur jaune
;En superposée
;Mode normal
;Coordonnée
LD    A,#00
LD    (#A100),DE   ;Coordonnée X
LD    (#A102),HL   ;Coordonnée Y
LD    (#A04),A
DI
LD B,#DF
OUT   (C),A
EXX
LD    A,C
AND   #F7
OUT   (C),A
LD    A,(#C000)
OUT   (C),C
EXX
;No ROM
;Plus de systeme
;Active No ROM
;Gate Array
;ROM haute oui
;Type de ROM
;ROM haute

CP    #80
JR    Z,#A0B5
CPL
LD    (#C000),A
LD    B,A
EXX
LD    A,C
AND   #F7
OUT   (C),A
LD    A,(#C000)
OUT   (C),C
EXX
CP    B
JR    NZ,#A0B1
CPL
LD    (#C000),A
LD    A,#03
JR    #A0B6
LD    A,#01
JR    #A0B6
XOR   A
EI
CALL  #BBDE
LD    DE,(#A100)
LD    HL,(#A102)   ;Positionnement
CALL  #BBC0
LD    A,(#A104)
PUSH  AF
RRCA
RRCA
RRCA
RRCA
CALL  #A0F3
POP   AF
CALL  #A0F3
LD    HL,(#A100)
;Rom BASIC=#80
;Relire la ROM
;Donnée écrite ?
;Donnée origine
;Rouge = RAMCARD
;Ecriture en RAM
;La RAMCARD est
;restée activée
;par le OUT #DF
;Jaune = ROM ok
;Rien = pas ROM
;Poids fort 
;Poids faible

LD    DE,#0028
ADD   HL,DE
EX    DE,HL
LD    HL,(#A102)
LD    A,(#A104)
INC   A
JR    Z,#A06E
LD    B,A
AND   #0F
LD    A,B
JR    NZ,#A076
LD    DE,#0000
LD    BC,#FFF0
ADD   HL,BC
JR #A076
AND #0F
ADD A,#30
CP #3A
JR C,#A0FD
ADD A,#07
JP #BB5A
;X=X+40 
;No ROM + 1
;Recommencer
;Fin ligne ? 
;X=0 ;Y=Y-16 
;Ligne suivante
;Affichage hexa
DEFM "ROMTEST "
DEFM "detection de " 
DEFM "ROM sur CPC." 
DEFB 0 
end

save'romtest.bin',#A000,end-start,DSK,'romtest_ramcard_release.dsk'
