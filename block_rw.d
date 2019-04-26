#!/usr/sbin/dtrace -C -s

#pragma D option quiet

dtrace:::BEGIN
{
  ops["block_preadv"] = 0;
  ops["block_pwritev"] = 0;
}

hyperkit$target:::block-preadv,
hyperkit$target:::block-pwritev
{
  ops[probefunc] += 1;
}

profile:::tick-5sec
{
  printf("%d,%d,%d\n", ops["block_pwritev"], ops["block_preadv"], (timestamp / 1000000000));
  ops["block_preadv"] = 0;
  ops["block_pwritev"] = 0;
}

dtrace:::END
{
}