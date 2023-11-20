from multi_key_quick_sort import multi_key_quick_sort
from vector import vector, print_v
from test_utils import corpus4, corpus7
from time import now

fn main():
	var v1 = vector("a", "d")
	print_v(v1)
	multi_key_quick_sort(v1)
	print_v(v1)

	v1 = vector("sam", "same", "her", "make", "zebra")
	print_v(v1)
	multi_key_quick_sort(v1)
	print_v(v1)

	v1 = vector("d", "a", "bb", "ab", "dfg", "efgds")
	print_v(v1)
	multi_key_quick_sort(v1)
	print_v(v1)

	var corpus = corpus7()
	print_v(corpus)
	var start = now()
	multi_key_quick_sort(corpus)
	var end = now()
	print_v(corpus)
	print(end - start)

	corpus = corpus4()
	print_v(corpus)
	start = now()
	multi_key_quick_sort(corpus)
	end = now()
	print_v(corpus)
	print(end - start)
