#include <stdio.h>
double* broadcasting(float* A, int* V, int n, int m);

int main() {
	float A[] = { 3, 29, 1, 12,
				  2.5, 18, 1, -4,
				  0, -3, 1, -8 };

	int V[] = { 3, 
			   -4 , 
				1};
	int n = 3;
	int m = 4;

	double* wynik = broadcasting(A, V, n, m);
	for (int i = 0; i < n * m; i++) {
		printf("%f ", wynik[i]);
	}

	return 0;
}