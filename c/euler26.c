#include <stdio.h>
#include <math.h>

main()
{
  int i,ans;
  int j;
  int f = pow(10,j);
  int max=0;
  for (i=997;i>1;i--)
    for(j=1;j<=i;j++)
      if ((f-1)%i==0)
	if (i-j==1)
	  break;
  printf("%d\n",i);
}
