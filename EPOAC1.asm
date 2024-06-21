.text
.globl main

main: 
    lw $t0, $b1 # Carrega o valor de b1 em t0
    lw $t1, $b2 # Carrega o valor de b2 em t1
    xor $t2, $t0, $t1 # Faz a operação XOR entre t0 e t1 e armazena em t2
    addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
    sw $t2, 0($sp) # Armazena o valor de t2 na pilha
    lw $t0, $vaium # Carrega o valor de vaium em t0
    lw $v0, 0($sp) # Carrega o valor da pilha em v0
    addi $sp, $sp, 4 # Incrementa o ponteiro de pilha
    xor $t1, $t0, $v0 # Faz a operação XOR entre t0 e v0 e armazena em t1, SOMA ESTÁ EM T1

    lw $t0, $b1 # Carrega o valor de b1 em t0
    lw $t2, $b2 # Carrega o valor de b2 em t2
    and $t3, $t0, $t2 # Faz a operação AND entre t0 e t2 e armazena em t3
    addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
    sw $t3, 0($sp) # Armazena o valor de t3 na pilha

    lw $t4, $vaium # Carrega o valor de vaium em t4
    and $t5, $t4, $t0 # Faz a operação AND entre t4 e t0 e armazena em t5
    addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
    sw $t5, 0($sp) # Armazena o valor de t5 na pilha

    and $t6, $t2, $t4 # Faz a operação AND entre t2 e t4 e armazena em t6
    addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
    sw $t6, 0($sp) # Armazena o valor de t6 na pilha

    lw $t0, 0($sp) # Carrega o valor da pilha em t0
    addi $sp, $sp, 4 
    lw $t1, 0($sp) # Carrega o valor da pilha em t1
    addi $sp, $sp, 4 
    lw $t2, 0($sp) # Carrega o valor da pilha em t2
    addi $sp, $sp, 4 

    or $t4, $t0, $t1 # Faz a operação OR entre t0 e t1 e armazena em t4
    or $t5, $t4, $t2 # Faz a operação OR entre t4 e t2 e armazena em t5, SOMA ESTÁ EM T5

    move $a0, $t4 # Move o valor de t4 para o registrador $a0
    li $v0, 1 # Carrega o valor 1 para o registrador $v0 (código da syscall para imprimir inteiro)
    syscall # Chama a syscall para imprimir o valor de $a0


.data 
$b1: .word 1
$b2: .word 0
$vaium: .word 0
$soma: .word 0
