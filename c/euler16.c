#include <stdio.h>
#define SIZE 500
#define POWER 1000

main()
{
  int digits[SIZE] = {0};
  int high_order = 0;
  int i = 1;
  int sum = 0;
  digits[0] = 1;

  for(i=1;i<=POWER;i++)
    {
      int j;
      int carry = 0;
      int product = 1;

      for(j=0;j<=high_order;j++)
	{
	  product = (digits[j] << 1) + carry;
	  digits[j] = product % 10;
	  carry = product / 10;

	  if ((carry!=0)&&(j==high_order))
	    high_order++;
	}
    }
  for (i=0;i<=high_order;i++)
    sum+=digits[i];

  printf("%d\n",sum);
}
