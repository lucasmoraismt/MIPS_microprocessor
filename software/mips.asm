LI $t0, 0

LI $t1, 40
SW $t1, 0($t0)
LI $t1, 60
SW $t1, 4($t0)

LW $s0, 0($t0)  # velocidade = 40
LW $s1, 4($t0)  # velocidade_permitida = 60

SLT $s2, $s1, $s0   # $s2 = (velocidade_permitida < velocidade)

BEQ $s2, $t0, set_one  # brach to set_one if velocidade < velocidade_permitida

# if velocidade > velocidade_permitida

LI $t1, 1
SW $t1, 12($t0)

J end

set_one:
    LI $t1, 0
    SW $t1, 12($t0)

end:
    LW $s3, 12($t0)