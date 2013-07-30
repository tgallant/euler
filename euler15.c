#include <stdio.h>

main()
{
  double i,c;
  int j,f;
  i=c=1;
  for(f=1;f<=40;f++)
    c*=f;
  for(j=1;j<=20;j++)
    i*=j;
  printf("%.0f\n",c/(i*i));
}
