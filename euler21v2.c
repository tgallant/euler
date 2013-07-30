#include <stdio.h>

main()
{
  int i,j,c,f,x,total;
  for(i=1;i<=10000;i++)
    {
      c=0;
      x=0;
      for(j=1;j<i;j++)
	if (i%j==0)
	  c+=j;
      for(f=1;f<c;f++)
	if (c%f==0)
	  x+=f;
      if (x==i && i!=c)
	total+=i;
    }
  printf("%d\n",total);
}
