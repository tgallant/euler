#include <stdio.h>

main()
{
  int a,b,c,d,w,x,y,z,r;
  int year, newyear;
  int month;
  int ans;
  int day = 1;
  for(year=1;year<=100;year++)
    for(month=1;month<=12;month++)
      {
	if(month==1 || month==2)
	  {
	    a = month+10;
	    newyear = year -1;
	  }
	else
	  {
	    a = month-2;
	    newyear=year;
	  }
	b=1;
	c=year;
	d=19;
	w=((13*a-1)/5)/5;
	x=c/4;
	y=d/4;
	z=w+x+y+b+c-2*d;
	r=z%7;
	if (r==0)
	  ans++;
      }
  printf("%d\n",ans);
}
