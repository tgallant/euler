#include<stdio.h>
#include<math.h>

main()
{
  int i,f,c,ans,max=0,b=0,j=0,n=0,a[1000000]={};
  for(i=2;i<1000000;i++)
    if(prime(i))
      a[j++]=i;
  for(i=j;i>0;i--)
    for(f=0;f<j;f++)
      {
	if(a[i]<900000)
	  break;
	b=0;
	n=0;
	while(b<=a[i])
	  {
	    if(b==a[i])
	      {
		c=n;
		break;
	      }
	    b+=a[f+n];
	    n++;
	  }
	if(c>max)
	  {
	    max=c;
	    ans=a[i];
	  }
      }
  printf("%d: %d\n",ans,max);
}


int prime(int x)
{
  if (x==1)
    return 0;
  else if (x<4)
    return 1;
  else if (x%2==0)
    return 0;
  else if (x<9)
    return 1;
  else if (x%3==0)
    return 0;
  else
    {
      int r = (int) sqrt(x);
      int f = 5;
      
      while (f<=r)
	{
	  if (x%f==0)
	    {
	      return 0;
	      break;
	    }
	  if (x%(f+2)==0)
	    {
	      return 0;
	      break;
	    }
	  f=f+6;
	}
      return 1;
    }
}
