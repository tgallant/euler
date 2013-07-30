#include <stdio.h>
#define LIMIT 100000

main()
{
  int i,f,j,z;
  unsigned long long int y;
  int a =0;
  int x =0;
  int c[LIMIT];
  for(i=95;i<=100;i++)
    for(f=95;f<=100;f++)
      {
	c[x++]=power(i,f);
      }
  for(i=0;i<x;i++)
    printf("%llu\n",c[i]);
  printf("total: %d\n",x);
}

int power(int x, int y)
{
  int i;
  int j = x;
  for(i=1;i<y;i++)
    x*=j;
  return x;
}
