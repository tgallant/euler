#include <stdio.h>
#include <math.h>

main()
{
  int a,b,n,primes,co1,co2,max;
  for(a=-1000;a<1000;a++)
    for(b=-1000;b<1000;b++)
      {
	n=0;
	while(prime((n*n)+(a*n)+b) && ((n*n)+(a*n)+b)>0)
	  n++;
	if(n>max)
	  {
	    max=n;
	    co1=a;
	    co2=b;
	  }
      }
  printf("%d\t%d\tprimes: %d\t ans: %d\n",co1,co2,max,(co1*co2));
}


int prime(int x)
{
  if (x==1)
    return 0;
  else if (x<4)
    return 1;
  else if (x%2==0)
    return 0;
  else if (x<9)
    return 1;
  else if (x%3==0)
    Return 0;
  else
    {
      int r = (int) sqrt(x);
      int f = 5;
      
      while (f<=r)
	{
	  if (x%f==0)
	    {
	      return 0;
	      break;
	    }
	  if (x%(f+2)==0)
	    {
	      return 0;
	      break;
	    }
	  f=f+6;
	}
      return 1;
    }
}
