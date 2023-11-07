#include <stdio.h>
#include <stdlib.h>
#include "md2.h"

int main(int argc, char *argv[])
{
  int w1, h1, w2, h2;
  int *matrix1;
  int *matrix2;
  int *matrix_result;
  int *p;

  scanf("%d %d", &h1, &w1);

  // allocate memory for matrix
  matrix1 = (int *)malloc(sizeof(int) * h1 * w1);

  // read matrix
  for (p = matrix1; p < matrix1 + h1 * w1; p++)
    scanf("%d", p);

  scanf("%d %d", &h2, &w2);

  // allocate memory for matrix
  matrix2 = (int *)malloc(sizeof(int) * h2 * w2);

  // read matrix
  for (p = matrix2; p < matrix2 + h2 * w2; p++)
    scanf("%d", p);

  int w_result = w2;
  int h_result = h1;
  if (w1 != h2)
  {
    // Incompatible matrices
    free(matrix1);
    free(matrix2);
    exit(1);
  }
  // allocate memory for matrix
  matrix_result = (int *)malloc(sizeof(int) * h_result * w_result);

  matmul(h1, w1, matrix1, h2, w2, matrix2, matrix_result);

  int i, j;
  printf("%d %d\n", h_result, w_result);
  for (i = 0; i < h_result; i++)
  {
    for (j = 0; j < w_result; j++)
    {
      printf("%d", matrix_result[i * w_result + j]);
      if (j != w_result - 1)
        printf(" ");
    }
    printf("\n");
  }
  // free memory
  free(matrix1);
  free(matrix2);
  free(matrix_result);

  return 0;
}
