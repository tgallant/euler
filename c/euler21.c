#include <stdio.h>
#define VAR 200
main()
{
  unsigned long long int i,j,c,f,x,y;
  unsigned long long int total;
  for(i=VAR;i<=300;i++)
    {
      for(j=VAR;j<i;j++)
	{
	  c=0;
	  if (i%j==0)
	    c+=j;
	  for(f=VAR;f<=300;f++)
	    {
	      for(x=VAR;x<f;x++)
		{
		  y=0;
		  if(f%x==0)
		    y+=x;
		}
	      if(i==y && f==c)
		printf("%llu, %llu\n",i,f);
	    }
	}
    }
  //printf("%llu\n",total);
}
