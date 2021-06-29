.data
.text
main:
	lui		$s0, 0x1001
	ori		$s1, $s0, 0x24
	addi	$s2, $zero, 1
	addi	$s3, $zero, 32
	sll		$t0, $s2, 4
	srl		$t1, $s3, 4
	sub		$t2, $t0, $t1
	
	sw		$t0, 0($s0)
	lw		$t7, 0($s0)

	#bne		$t0, $zero, isZero	# if $t0 != $zero then isZero
	add		$at, $zero, $t0
	beq		$t0, $at, notZero	# if $t0 == $at then notZero

isZero:
	addi	$t6, $zero, 7

notZero:
	addi	$t5, $zero, 8
	
	jal		sumt0
	
next:
	addi	$t9, $zero, 0xA
	j		exit
	

sumt0:
	addi	$t0, $t0, 5
	jr		$ra

exit:


	
	#assign real_address_w = {2'b00, address_i[DATA_WIDTH-1:29], 1'b0, address_i[27:17], 1'b0, address_i[15:2]};
	#//shift 2 times right (divide by 4) and subtract 0x0040_0000 from logical address
	#assign real_address_r = {2'b0, address_i[(DATA_WIDTH-1):19], 1'b0, address_i[17:2]};
