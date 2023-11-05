#include <stdio.h>
#include <stdlib.h>
#include "md2.h"

int main(int argc, char *argv[])
{
  char input[100];          // Declare a char array to hold the input
  fgets(input, 100, stdin); // Read up to 100 characters from stdin

  // print to stdout
  printf("Hello, %s\n", input);

  return 0;
}
