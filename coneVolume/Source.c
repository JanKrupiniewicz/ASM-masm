#include <stdio.h>
float* single_neuron(double* x, float* w, unsigned int n);
float objetsc_stozka(double* R, float* r, float* h);

int main() {
	// zadanie _objetsc_stozka
	double R = 10; float r = 5; float h = 4;
	printf("%f", objetsc_stozka(&R, &r, &h));

	// zadanie _signle_neuron
	double x[] = { 1.0, 2.0, 3.0, 4.0 , -5.0, 6.0 , 7.0, 8.0 , 9.0, -10.0 };
	float w[] = { 1.0, 1.0, 1.0, 1.0 , 1.0, -2.0 , 1.0, 2.0 , 1.0, 2.0 };
	int n = sizeof(x) / sizeof(x[0]);
	float* wynik = single_neuron(x, w, n);
	printf("%f", *wynik);
	return 0;
}