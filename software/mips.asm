LI $t0, 0

LI $t1, 40
SW $t1, 0($t0)
LI $t1, 60
SW $t1, 4($t0)

LW $s0, 0($t0)  # velocidade = 40
LW $s1, 4($t0)  # velocidade_permitida = 60

SLT $s2, $s1, $s0   # $s2 = (velocidade_permitida < velocidade)

SW $s2, 12($t0)