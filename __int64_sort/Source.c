#include <stdio.h>
unsigned __int64 sortowanie(unsigned __int64* tab1, unsigned int n);


int main()
{
	unsigned __int64 tab[6] = { 900337203685477, 922337203685477,
		100000000007, 6, 8, 922337203685477586 };
	unsigned __int64 najwieksza = sortowanie(tab, 6);
	printf("Tablica po posortowaniu : ");
	for (int i = 0; i < 6; i++) {
		printf("%I64u ", tab[i]);
	}
	printf("\nNajwiekszy element : %I64u", najwieksza);
	return 0;
}