#include <stdio.h>

typedef long long int UINT48;

float progowanie_sredniej_kroczacej(float* tablica, unsigned int k, unsigned int m);
float* single_neuron(double* x, float* w, unsigned int n);
float uint48_float (UINT48 p);


int main() {
	// zadanie 1
	float tab[] = { 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0 };
	unsigned int n = sizeof(tab) / sizeof(tab[0]);
	unsigned int m = 5;
	float srednia = progowanie_sredniej_kroczacej(tab, n, m);
	printf("%f\n \n", srednia);
	
	// zadanie 2
	// tutaj Single Neuron
	
	// zadanie 3
	UINT48 p = 0x30000;
	float wynik = uint48_float(p);
	printf("%f", wynik);
	return 0;
}