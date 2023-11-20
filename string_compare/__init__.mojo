from math import min
from math.bit import bswap
from memory import memcmp

fn lt(a: StringLiteral, b: StringLiteral) -> Bool:
	let p1 = a.data().bitcast[DType.uint8]()
	let p2 = b.data().bitcast[DType.uint8]()
	let l1 = len(a)
	let l2 = len(b)
	let min_len = min(l1, l2)
	for i in range(min_len):
		let ai = p1.load(i)
		let bi = p2.load(i)
		if ai > bi:
			return False
		if ai < bi:
			return True
	return l1 <= l2

fn lt2(a: StringLiteral, b: StringLiteral) -> Bool:
	let l1 = len(a)
	let l2 = len(b)
	let min_len = min(l1, l2)
	let res = memcmp(a.data(), b.data(), min_len)
	if res == 0:
		return l1 <= l2
	return res < 0

fn lt3(a: StringLiteral, b: StringLiteral) -> Bool:
	var p1 = a.data().bitcast[DType.uint8]()
	var p2 = b.data().bitcast[DType.uint8]()
	let l1 = len(a)
	let l2 = len(b)
	var rest_len = min(l1, l2)

	while rest_len >= 8:
		let ai = bswap(p1.bitcast[DType.uint64]().load())
		let bi = bswap(p2.bitcast[DType.uint64]().load())
		if ai > bi:
			return False
		if ai < bi:
			return True
		p1 = p1.offset(8)
		p2 = p2.offset(8)
		rest_len -= 8

	if rest_len >= 4:
		let ai = bswap(p1.bitcast[DType.uint32]().load())
		let bi = bswap(p2.bitcast[DType.uint32]().load())
		if ai > bi:
			return False
		if ai < bi:
			return True
		p1 = p1.offset(4)
		p2 = p2.offset(4)
		rest_len -= 4
	
	if rest_len >= 2:
		let ai = bswap(p1.bitcast[DType.uint16]().load())
		let bi = bswap(p2.bitcast[DType.uint16]().load())
		if ai > bi:
			return False
		if ai < bi:
			return True
	
	if rest_len == 1:
		let ai = p1.load()
		let bi = p2.load()
		if ai > bi:
			return False
		if ai < bi:
			return True

	return l1 <= l2
