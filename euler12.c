#include <stdio.h>

main()
{
  unsigned long int i,j,f,sum;
  for (i=1;i<1000000000;i++)
    {
      sum+=i;
      for (j=1;j<=sum;j++)
	if (sum%j==0)
	  f++;
      if (f>=500)
	printf("%ld, ",sum);
      f=0;
    }
}

/*int prime(int x)
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
    return 0;
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
    }*/
