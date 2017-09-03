# bblas_interleaved
Basic implementation of batched (GEMM, TRSM, POTRF, POSV) using an interleaved memory layout suitable for 
use on multicore systems and the self-hosted Intel Xeon Phi (KNL).

We can achieve exceptionally good performance for small matrix sizes when compared to MKL.

## Compilation
So far the optimization flags are only supported by icc, they can 
be motified to support gcc, but we don't guarantee the same performance.

## Execution 
We acheive a relatively good performance by taking advantage of
the KNL MCDRAM. To control the memory allocation we use hbw_malloc 
and hbw_free instead of a simple malloc and free respectively.
The hbw_malloc is from the memkind library. 
Alternatively, all the hbw_malloc and hbw_free may be replaced 
by a simple malloc and free but excute the code using "numactl -m 1" 
to force the program to  allocate all its memory in the MCDRAM. 

