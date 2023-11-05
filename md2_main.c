#include <stdio.h>
#include <stdlib.h>
#include "md2.h"

int main(int argc, char *argv[])
{
  int w, h;
  int *matrix;
  int *p;

  scanf("%d %d", &h, &w);

  // allocate memory for matrix
  matrix = (int *)malloc(sizeof(int) * h * w);

  // read matrix
  for (p = matrix; p < matrix + h * w; p++)
    scanf("%d", p);

  // print matrix
  printf("W:%d H:%d", w, h);

  // free memory
  free(matrix);

  return 0;
}
