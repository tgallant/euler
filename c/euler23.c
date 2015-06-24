#include <stdio.h>
#define LIMIT 28123
main()
{
  int i,j,c;
  unsigned long int sum;
  unsigned int arr[LIMIT];
  for(i=1;i<LIMIT;i++)
    arr[i]=i;
  for(i=1;i<LIMIT;i++)
    {
      for(j=1;j<i;j++)
	{
	  c=i-j;
	  if (abund(c)==0 && abund(j)==0)
	    {
	      printf("%d\n",i);
	      arr[i]='\0';
	      break;
	    }
	}
    }
  for(i=1;i<LIMIT;i++)
    sum+=arr[i];
  printf("%lu\n",sum);
}

int abund(int x)
{
  int y,z;
  z=0;
  for (y=1;y<x;y++)
    {
      if (x%y==0)
	z+=y;
    }
  if (z>x)
    return 0;
  else
    return 1;
}
