#!/bin/bash
for m in {2..32..1}
do
    for n in {1..$m..1}
    do
	./test_dtrsm $m $n 256
    done
done
