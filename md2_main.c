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

  scanf("%d %d", &w1, &h1);

  // allocate memory for matrix
  matrix1 = (int *)malloc(sizeof(int) * h1 * w1);

  // read matrix
  for (p = matrix1; p < matrix1 + h1 * w1; p++)
    scanf("%d", p);

  scanf("%d %d", &w2, &h2);

  // allocate memory for matrix
  matrix2 = (int *)malloc(sizeof(int) * h2 * w2);

  // read matrix
  for (p = matrix2; p < matrix2 + h2 * w2; p++)
    scanf("%d", p);

  int w_result = w1;
  int h_result = h2;
  // allocate memory for matrix
  matrix_result = (int *)malloc(sizeof(int) * h_result * w_result);

  // print matrix
  printf("W1:%d H1:%d", w1, h1);
  for (p = matrix1; p < matrix1 + h1 * w1; p++)
    printf("%d ", *p);
  printf("\n");

  printf("W2:%d H2:%d", w2, h2);
  for (p = matrix2; p < matrix2 + h2 * w2; p++)
    printf("%d ", *p);
  printf("\n");

  // call matmul

  // free memory
  free(matrix1);
  free(matrix2);
  free(matrix_result);

  return 0;
}
