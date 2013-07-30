#include <stdio.h>
#include <stdlib.h>

main()
{
  int i,j,sum;
  char *sieve = calloc(2000000, 1);
  for (i=2; i*i <= 2000000; i++)
    {
      if (!sieve[i]) {
	for(j = i+i; j < 2000000; j+=i) { sieve[j] = 1; }
      }
    }
  for (i=2; i<2000000; i++)
    {
      if (!sieve[i]) { sum+=i; }
  }
  printf("%d",sum);
}
