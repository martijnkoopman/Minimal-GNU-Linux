#include <stdio.h>
#include <unistd.h>

int main() {
    printf("Hello world\n");
    sleep(0xFFFFFFFF);
    return 0;
}