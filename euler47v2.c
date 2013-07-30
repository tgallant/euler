#include<stdio.h>
#include<math.h>

main()
{
  int i,f=1,c=0,j=0,a[1000];
  for(i=1;i<74;i++)
    if(prime(i))
      {
	printf("%d: %d\n", j++, i);
	c+=i;
      }
  printf("%d\n",c);
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
}
