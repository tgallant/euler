#include <stdio.h>

int prime(int n)
{
  int j;
  for (j=2;j<=n/2;j++)
    {
      if((n%j)==0)
	{
	  return 0;
	}
    }
  return 1;
}
void main()
{
  int i,p;
  long long int total = 0;
  for (i=2;i<=2000000;i++)
    {
      p=prime(i);
      if(p==1)
	printf("%d\n",i);
	total+=i;
    }
  printf("sum: %lld\n",total);
}
