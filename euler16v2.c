#include <stdio.h>
#define SIZE 1000
#define POWER 1000

main()
{
  int i;
  int j[SIZE];
  for(i=1;i<=POWER;i++)
    j[i] = i*=i;
  for(i=1;i<=500;i++)
    printf("%d\n",j[i]);
}
