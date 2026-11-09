# Cache Behavior Lab

Completed row-major and column-major summation functions using the original starter matrix allocation and timing harness.

## Run

```sh
gcc cache_lab.c -o cache_lab
./cache_lab
gcc -O0 cache_lab.c -o cache_O0 && ./cache_O0
gcc -O2 cache_lab.c -o cache_O2 && ./cache_O2
gcc -O3 cache_lab.c -o cache_O3 && ./cache_O3
```

The program tests 1000, 2000, 4000, and 8000 square matrices and prints both sums, execution times, and the column/row ratio.

## Submission files

- [cache_lab.c](cache_lab.c): both completed traversal implementations.
- [analysis.md](analysis.md): all four analysis sections, tables, assembly screenshots, cache explanation, and final project connection.
- [measurements.txt](measurements.txt): actual output from three trials per optimization level.
- [row_major_O2.jpg](row_major_O2.jpg) and [column_major_O2.jpg](column_major_O2.jpg): Compiler Explorer screenshots, x86-64 GCC 16.2 with `-O2`.
- [cache_O2.s](cache_O2.s): local GCC 13.3.0 assembly from the benchmark source.

Measurements were collected on a remote Linux x86-64 machine; results vary with hardware and system conditions. The analysis documents these limitations and the starter's separately allocated rows.

Starter: https://github.com/RizeComputerScience/COMPSXII-Assignment8
