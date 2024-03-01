#include <stdio.h>

long long* convert_to_array(char* tekst);

int main() {
	char tekst[] = "1 3 45 6";
	long long convert = convert_to_array(&tekst);
	return 0;
}