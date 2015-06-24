#include <stdio.h>
#include <time.h>

main()
{
  clock_t tic=clock();
  unsigned int i,c,j,f,max,ans;
  max=0;
  for(i=1;i<=1000000;i++)
    {
      f=i;
      j=0;
      while (f>1)
	{
	  if(f%2==0)
	    {
	      c=f/2;
	      f=c;
	      j++;
	    }
	  else
	    {
	      c=(3*f)+1;
	      f=c;
	      j++;
	    }
	}
      if (j>max)
	{
	  max=j;
	  ans=i;
	}
    }
  clock_t toc=clock();
  printf("ANS: %u in TIME: %f\n",ans,(double)(toc-tic)/CLOCKS_PER_SEC);
}
