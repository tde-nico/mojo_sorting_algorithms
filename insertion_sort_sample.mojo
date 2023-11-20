from vector import print_v, vector
from insertion_sort import insertion_sort
from string_compare import lt, lt2, lt3
from test_utils import corpus4, corpus7
from time import now

fn main():
	var v1 = DynamicVector[UInt32]()
	v1.push_back(13)
	v1.push_back(31)
	v1.push_back(1)
	v1.push_back(7)
	v1.push_back(7)
	v1.push_back(4513)
	v1.push_back(45)

	print_v[DType.uint32](v1)
	insertion_sort[DType.uint32](v1)
	print_v[DType.uint32](v1)

	var v2 = vector("d", "a", "bb", "ab", "dfg", "edfgds")
	print_v(v2)
	insertion_sort[StringLiteral, lt](v2)
	print_v(v2)

	var corpus = corpus7()
	var start = now()
	insertion_sort[StringLiteral, lt3](corpus)
	var end = now()
	print_v(corpus)
	print(end - start)
	
	corpus = corpus4()
	start = now()
	insertion_sort[StringLiteral, lt3](corpus)
	end = now()
	print_v(corpus)
	print(end - start)
