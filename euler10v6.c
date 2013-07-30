#include <stdio.h>
#include <stdlib.h>

#define LIMIT 2000000

int main(){
  unsigned long long int i,j,sum=0;
  int *primes;

  primes = malloc(sizeof(int)*LIMIT);

  for (i=2;i<LIMIT;i++)
    primes[i]=1;

  for (i=2;i<LIMIT;i++)
    if (primes[i])
      for (j=i;i*j<LIMIT;j++)
	primes[i*j]=0;

  for (i=2;i<LIMIT;i++)
    if (primes[i])
      sum = sum+i;
  printf("%llu\n",sum);
  return 0;
}
