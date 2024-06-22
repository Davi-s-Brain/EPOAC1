.text
.globl main

main: 
    lw $t0, $b1 # Carrega o valor de b1 em t0
    lw $t1, $b2 # Carrega o valor de b2 em t1
    jal somabit # Chama a função somabit
    j fim # Pula para o fim

fim:
    la $a0, $resultadoSoma # Printando o resultado da soma
    li $v0, 4
    syscall

    move $a0, $t7 # Transferindo o conteúdo do registrador t6 para a0
    li $v0, 1
    syscall
  
    la $a0, $resultadoVaiUm # Carrega o endereço da string em a3
    li $v0, 4
    syscall

    move $a0, $t6 # Printando o vai-um
    li $v0, 1 
    syscall

    li $v0, 10 # Termina o programa
    syscall

somabit:
    xor $t2, $t0, $t1 # Faz a operação XOR entre t0 e t1 e armazena em t2
    addi $sp, $sp, -4 # Decrementa o ponteiro de pilha
    sw $t2, 0($sp) # Armazena o valor de t2 na pilha
    lw $t0, $vaium # Carrega o valor de vaium em t0
    lw $v0, 0($sp) # Carrega o valor da pilha em v0
    addi $sp, $sp, 4 # Incrementa o ponteiro de pilha
    xor $t7, $t0, $v0 # Faz a operação XOR entre t0 e v0 e armazena em t1

    lw $t0, $b1
    lw $t2, $b2
    and $t3, $t0, $t2 # Faz a operação AND entre t0 e t2 e armazena em t3
    addi $sp, $sp, -4
    sw $t3, 0($sp)

    lw $t4, $vaium
    and $t5, $t4, $t0 # Faz a operação AND entre t4 e t0 e armazena em t5
    addi $sp, $sp, -4
    sw $t5, 0($sp)

    and $t6, $t2, $t4 # Faz a operação AND entre t2 e t4 e armazena em t6
    addi $sp, $sp, -4
    sw $t6, 0($sp)

    lw $t0, 0($sp) 
    addi $sp, $sp, 4 
    lw $t1, 0($sp) 
    addi $sp, $sp, 4 
    lw $t2, 0($sp) 
    addi $sp, $sp, 4 

    or $t4, $t0, $t1
    or $t6, $t4, $t2 # Faz a operação OR entre t4 e t2 e armazena em t5, SOMA ESTÁ EM T5

    jr $ra


.data 
$b1: .word 1
$b2: .word 0
$vaium: .word 1
$soma: .word 0
$resultadoSoma: .asciiz "Resultado da soma: "
$resultadoVaiUm: .asciiz " Resultado do vai-um: "