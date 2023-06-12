# $s0 will be a_i
# $s1 will be b_i
# $s2 will be c_i

addi $s0, $0, 1
addi $s1, $0, -1
addi $s2, $0, 1
sll $s2, $s2, 9

#init:
# $t0 to be i
# %t1 to be 10
# $s5 to be sum
addi $t0, $0, 0
addi $t1, $0, 10
addi $s5, $0, 0
loop:
	slt $t2, $t0, $t1
	beq $t2, $0, end
	# $s5 = $s5 + $s0*$s1*$s2
	mult $s0, $s1
	mflo $t3
	mult $s2, $t3
	mflo $t3
	add $s5, $s5, $t3
	
	#$s0 = $s0*4
	sll $s0, $s0, 2
	
	#s1 = $s1 * -1
	addi $t3, $0, -1
	mult $s1, $t3
	mflo $s1
	
	#s2 = $s2 / 2
	srl $s2, $s2, 1

	# i++
	addi $t0, $t0, 1
	# jump to loop
	j loop				
	
end:
# $s5 = 0x0002aa00 = 174,592