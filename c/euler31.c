#include <stdio.h>

main()
{
  int n,i,f,j,c,x,y,z;
  int total;

  for(n=0;n<=1;n++)
  for(i=0;i<=2;i++)
    for(f=0;f<=4;f++)
      for(j=0;j<=10;j++)
	for(c=0;c<=20;c++)
	  for(x=0;x<=40;x++)
	    for(y=0;y<=100;y++)
	      for(z=0;z<=200;z++)
		if(n*200+i*100+f*50+j*20+c*10+x*5+y*2+z*1 == 200)
		  total++;
  printf("%d\n",total);
}		  
