#include <stdio.h>

unsigned long long int binar(unsigned long long int k)
{
  if (k==0) return 0;
  if (k==1) return 1;
  return (k%2)+10*binar(k/2);
}

unsigned long long int reverse(unsigned long long int num_)
{
  unsigned long long int inv; inv=0;
  while (num_>0)
    {
      inv = inv*10+(num_%10);
      num_=num_/10;
    }
  return inv;
}

main()
{
  unsigned long long int i;
  int sum=0;
  for(i=1;i<1000000;i++)
    {
      unsigned long long int n=binar(i);
      if(reverse(n)==n && reverse(i)==i)
	sum+=i;
    }
  printf("%d\n",sum);
}
