#include <stdio.h>
#include <xmmintrin.h>
float objetosc_stozka(unsigned int big_r, unsigned int small_r, float h);
void mul_at_once(__m128* one, __m128* two, unsigned int n);

int main() {
	// - czesc 1
	float w1 = objetosc_stozka(6, 2, 5.3);
	float w2 = objetosc_stozka(7, 3, 4.2);
	float w3 = objetosc_stozka(8, 4, 6.1);
	printf("Wynik: %f    %f    %f \n \n", w1, w2, w3);
	
	// - czesc 2
	__m128 tab1[] = { 12.0, 13.0, 14.0, 15.0, 
						16.0, 17.0, 18.0, 19.0 };
	__m128 tab2[] = { 12.0, 13.0, 14.0, 15.0, 
						16.0, 17.0, 18.0, 19.0 };

	unsigned int n = sizeof(tab1) / sizeof(tab1[0]);
	mul_at_once(tab1, tab2, n);

	for (int i = 0; i < n; i++) {
		printf("%f %f %f %f \n",
			tab1[i].m128_f32[0],
			tab1[i].m128_f32[1],
			tab1[i].m128_f32[2],
			tab1[i].m128_f32[3]);
	}

	return 0;
}