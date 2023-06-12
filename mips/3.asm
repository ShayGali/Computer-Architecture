# init:
# $t0 = add
# $t1 = n (init to 1)
# $t2 = end (init to 29)
# $t3 = i (init to 0)

# $t0 = 0x10011020
lui $t0, 0x1001
ori $t0, 0x1020

addi		$t1, $0, 1		# $t1 = 1
addi		$t2, $0, 29		# $t2 = 29
addi		$t3, $0, 0		# $t3 = 0

loop:
    beq		$t2, $t1, done	# if $t2 == $t1 then goto done

    # progress of the address
    sll		$t4, $t1, 2			# $t4 = $t1 << 2 # $t4 = i * 4
    add		$t0, $t0, $t4		# $t0 = $t0 + $t4 

    # save n into the address
    sw		$t1, 0($t0)		    # $t0 = $t1
    
    # i++
    addi	$t3, $t3, 1			# $t3 = $t3 + 1
    
    # n+=2
    addi	$t1, $t1, 2			# $t1 = $t1 + 2
    
    j		loop				# jump to loop
    

done:
