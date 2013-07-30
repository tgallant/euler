#include <stdio.h>
#define target 1000


int main (void)
{
  int a = 0, b = 0,c = 0,n = 0, m = 22;
  int tar = target / 2;
  int found = 0;

  while (!found)
    {
      int divides = ( tar - m*m ) % m;
      if (!divides) // If there is no remainder
	{
	  int a_sqr, b_sqr, c_sqr;


	  n = ( tar - m*m ) / m ;


	  if ( m < n )
	    {
	      printf("No solution was found.\n");
	      break;
	    }

	  a = m*m - n*n;
	  b = 2*m*n;
	  c = m*m + n*n;

	  a_sqr = a * a;
	  b_sqr = b * b;
	  c_sqr = c * c;


	  if ( (a_sqr + b_sqr) == c_sqr )
	    found = 1;
	}
      m--;
    }


  printf("a = %d, b = %d, c = %d\n", a, b, c);
  printf("abc = %d", a*b*c);


  return 1;
}
