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

  // call matmul
  printf("from c H1: %u\nfrom c W1: %u\n", h1, w1);
  printf("from c H2: %u\nfrom c W2: %u\n", h2, w2);
  printf("result matrix size: %u\n", h_result * w_result);
  printf("Memory address 1 is: %lu\n", (unsigned long)matrix1);
  printf("Memory address 2 is: %lu\n", (unsigned long)matrix2);
  printf("Memory address 3 is: %lu\n", (unsigned long)matrix_result);

  matmul(h1, w1, matrix1, h2, w2, matrix2, matrix_result);
  printf("program finished?\n");

  int i;
  for (i = 0; i < h_result * w_result; i++)
  {
    printf("%d\n", matrix_result[i]);
  }
  // free memory
  free(matrix1);
  free(matrix2);
  free(matrix_result);

  return 0;
}
