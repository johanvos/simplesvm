#include <stdio.h>
#include <pthread.h>
#include <unistd.h>

extern void outBox(int argc, char** argv);

int main(int argc, char** argv) {
    fprintf(stderr, "Hello, JAVA main, argc = %d, argv = %p\n", argc, argv);
    outBox(argc, argv);
}

