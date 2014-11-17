#!/usr/sbin/dtrace -s

#pragma D option bufsize=512k
#pragma D option aggsize=512k
#pragma D option quiet
/* don't just die, especially when a system is in trouble, because
 * that's when we most want to get the stack traces to track down the
 * issue - whatever it is
 */
#pragma D option destructive


profile-197Hz
/ ! pset && arg0 && curthread->t_pri != -1 /
{
  @s[stack()] = count();
}

tick-1s
{
  printf("\n%Y\n",walltimestamp);

  /* Only show top 300 most frequently seen stacks */
  trunc(@s,300);

  printa(@s);

  trunc(@s);
}
