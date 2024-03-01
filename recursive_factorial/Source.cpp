#include <stdio.h>
extern "C" long long silnia(short numb);
extern "C" unsigned long long fibonacci(unsigned short numb);
extern "C" unsigned long long nwd_liczb(int* l1, int* l2);

int main() {
	short numb = 12;
	long long wynik_s = silnia(numb);
	long long wynik_f = fibonacci(numb);
	printf("%d\n", wynik_s);
	printf("%d", wynik_f);
	return 0;
}