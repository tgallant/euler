#include<stdio.h>

main()
{
  char set[7]="1234567";
  char scratch;
  int lastperm=0;
  int i,j,k,l;
  printf("%s\n",set);
  while(!lastperm)
    {
      j=-1;
      for(i=1;i<8;i++)
	{
	  if(set[i+1]>set[i])
	    j=i;
	}
      if(j==-1)
	lastperm=1;
      if(!lastperm)
	{
	  for(i=j+1;i<8;i++)
	    if(set[i]>set[j])
	      l=i;
	}
      scratch=set[j];
      set[j]=set[l];
      k=(7-j)/2;
      for(i=0;i<k;i++)
	{
	  scratch=set[j+l+i];
	  set[j+l+k]=set[7-i];
	  set[7-i]=scratch;
	}
      printf("%s/n",set);
    }
}
