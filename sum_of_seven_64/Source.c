#include <stdio.h>

__int64 suma_siedmiu_liczb(__int64 v1, __int64 v2, __int64
	v3, __int64 v4, __int64 v5, __int64 v6, __int64 v7);


int main() {
	__int64 l1 = 1, l2 = 2, l3 = 3, l4 = 4, 
		l5 = 5, l6 = 6, l7 = 100;
	__int64 suma_liczb = suma_siedmiu_liczb(l1, l2, l3, l4, l5, l6, l7);
	printf("%d", suma_liczb);
	return 0;
}