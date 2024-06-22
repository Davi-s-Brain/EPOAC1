#include <stdio.h>
#include <stdlib.h>

void somabit(int b1, int b2, int* vaium, int* soma) {
  *soma = (b1 ^ b2) ^ *vaium;
  *vaium = (b1 & b2) | (b1 & *vaium) | (b2 & *vaium);
}

int main() {
  int b1 = 1, b2 = 1, vaium = 1, soma;

  somabit(b1, b2, &vaium, &soma);

  printf("Soma: %d\n", soma);
  printf("Vai-um: %d\n", vaium);

  return 0;
}
