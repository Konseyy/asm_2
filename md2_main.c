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

  int w_result = w1;
  int h_result = h2;
  if (w2 != h1)
  {
    // Incompatible matrices
    free(matrix1);
    free(matrix2);
    exit(1);
  }
  // allocate memory for matrix
  matrix_result = (int *)malloc(sizeof(int) * h_result * w_result);

  // call matmul
  printf("from c H1: %d\nfrom c W1: %d\n", h1, w1);
  printf("Memory address 1 is: 0x%x\n", matrix1);
  printf("from c H2: %d\nfrom c W2: %d\n", h2, w2);
  printf("Memory address 2 is: 0x%x\n", matrix2);
  printf("Memory address 3 is: 0x%x\n", matrix3);

  matmul(h1, w1, matrix1, h2, w2, matrix2, matrix_result);
  printf("program finished?\n");
  // free memory
  free(matrix1);
  free(matrix2);
  free(matrix_result);

  return 0;
}
