#include <stdio.h>
#include <Windows.h>
unsigned int check_system_dir(char* directory);

int main() {
	char dir[256];
	int sprawdz_dir = check_system_dir(dir);
	if (sprawdz_dir) {
		printf("\n");
		for (int i = 0; i < sprawdz_dir; i++) {
			printf("%c", dir[i]);
		}
		printf("\n");
	}
	else {
		printf("Blad odczytu.");
	}
	return 0;
}