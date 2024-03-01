#include <stdio.h>
void szybki_max(float* a, float* b, float* w, unsigned int n);
void szybki_min(float* a, float* b, float* w, unsigned int n);

int main() {
	float a[] = { 1.0f, 2.0f, 3.0f, 4.0f, 1.0f, 2.0f, 3.0f, 4.0f, 1.0f, 9.0f, 3.0f, 4.0f };
	float b[] = { 4.0f, 3.0f, 2.0f, 1.0f, 1.0f, 2.0f, 3.0f, 4.0f, 4.0f, 2.0f, 9.0f, 4.0f, };
	float w_max[12];
	float w_min[12];
	int n = 12;

	szybki_max(a, b, w_max, n);
	szybki_min(a, b, w_min, n);

	return 0;
}