#include<stdio.h>
#include<math.h>

void swap(char *x, char *y)
{
  char temp;
  temp=*x;
  *x=*y;
  *y=temp;
}

int permute(char *a, int i, int n)
{
  int j;
  if(i==n)
    return a;
  else
    {
      for(j=i;j<=n;j++)
	{
	  swap((a+i), (a+j));
	  permute(a, i+1, n);
	  swap((a+i), (a+j));
	}
    }
}

main()
{
  char a[]= "123";
  int i,j,b[100];
  permute(a,0,2);
  b[i++]=permute(a,0,2);
  for(j=0;j<2;j++)
    printf("%d\n",b[j]);
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
