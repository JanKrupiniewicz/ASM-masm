#include <stdio.h>
#include <xmmintrin.h>

void dziel(__m128* tablica1, unsigned int n, float dzielnik);
void mnoz(__m128* tablica1, unsigned int n, float mnoznik);

float dzielnik = 2.0;
float mnoznik = 6.0;

int main() {
	__m128 tab1[] = { 12.0, 14.0, 14.5, 18.5, 12.2, 22.2, 16.5, 28.5 };
	unsigned int n = sizeof(tab1) / sizeof(tab1[0]);

	dziel(tab1, n, dzielnik);
	for (int i = 0; i < n; i++) {
		printf("%f %f %f %f ", 
			tab1[i].m128_f32[0],
			tab1[i].m128_f32[1],
			tab1[i].m128_f32[2],
			tab1[i].m128_f32[3]);
	}
	printf("\n");
	mnoz(tab1, n, mnoznik);
	for (int i = 0; i < n; i++) {
		printf("%f %f %f %f ",
			tab1[i].m128_f32[0],
			tab1[i].m128_f32[1],
			tab1[i].m128_f32[2],
			tab1[i].m128_f32[3]);
	}

	return 0;
}