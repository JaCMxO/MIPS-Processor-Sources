.data
.text
	lui		$s0, 0x1001
	ori		$s1, $s0, 0x24
	addi	$s2, $zero, 1
	addi	$s3, $zero, 32
	sll		$t0, $s2, 4
	srl		$t1, $s3, 4
	sub		$t2, $t0, $t1
	
	sw		$t0, 0($s0)
	lw		$t7, 0($s0)
	#assign real_address_w = {2'b00, address_i[DATA_WIDTH-1:29], 1'b0, address_i[27:17], 1'b0, address_i[15:2]};
	#//shift 2 times right (divide by 4) and subtract 0x0040_0000 from logical address
	#assign real_address_r = {2'b0, address_i[(DATA_WIDTH-1):19], 1'b0, address_i[17:2]};
