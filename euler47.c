#include <stdio.h>
#include <math.h>

main()
{
  int i,j=0,f=0,max=0,ans=0,n,c,a[500000];
  for(i=1;i<1000000;i++)
    if(prime(i))
      a[j++]=i;
  for(i=0;i<j;i++)
    {
      f=0;
      c=0;
      ans=0;
      while(f<=a[i])
	{
	  f+=a[c++];
	  if(f==a[i])
	    {
	      //printf("%d: %d,%d\n",f,c,i);
	      ans=1;
	      break;
	    }
	}
      if(ans==1)
	if(f>max)
	  max=f;
    }
  printf("%d\n",max);
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
