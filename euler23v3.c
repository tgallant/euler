#include<stdio.h>
#define LIMIT 25
main()
{
  int i;
  int arr[LIMIT];
  for(i=1;i<LIMIT;i++)
    arr[i]=i;
  for(i=1;i<LIMIT;i++)
    printf("%d\n",arr[i]);
}
