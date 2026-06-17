# Benchmark Results: square_test

## square_test
```txt
# started on Tue Jun 16 22:57:52 2026


 Performance counter stats for './square_test' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #     15.4 faults/sec  page_faults_per_second  ( +-  0.22% )
          3,907.92 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
        10,484,782      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  0.58% )  (50.01%)
    21,089,966,212      branches:u                       #   5396.7 M/sec  branch_frequency     ( +-  0.00% )  (50.02%)
    21,507,163,449      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.01% )  (66.68%)
    84,419,671,135      instructions:u                   #      3.9 instructions  insn_per_cycle  ( +-  0.00% )  (49.99%)
        74,382,459      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  1.11% )  (49.98%)

       # Table of individual measurements:
       3.910056859 (+0.001466517) #
       3.909948006 (+0.001357664) #
       3.907401620 (-0.001188722) #
       3.909537828 (+0.000947486) #
       3.908722763 (+0.000132421) #
       3.905706337 (-0.002884005) #
       3.908752248 (+0.000161906) #
       3.909764853 (+0.001174511) #
       3.906845138 (-0.001745204) #
       3.909377758 (+0.000787416) #
       3.909419547 (+0.000829205) #
       3.909106901 (+0.000516559) #
       3.908526916 (-0.000063426) #
       3.908246141 (-0.000344201) #
       3.907795487 (-0.000794855) #
       3.908118301 (-0.000472041) #
       3.907884143 (-0.000706199) #
       3.908518771 (-0.000071571) #
       3.907230871 (-0.001359471) #
       3.910846347 (+0.002256005) #

       # Final result:
       3.908590342 +- 0.000276654 seconds time elapsed  ( +-  0.01% )

```

## square_test-defensive
```txt
# started on Tue Jun 16 22:59:10 2026


 Performance counter stats for './square_test-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #     15.4 faults/sec  page_faults_per_second  ( +-  0.21% )
          3,906.32 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
         9,897,441      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  0.02% )  (49.99%)
    21,089,547,866      branches:u                       #   5398.8 M/sec  branch_frequency     ( +-  0.00% )  (50.01%)
    21,498,292,046      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.00% )  (66.69%)
    63,331,783,131      instructions:u                   #      2.9 instructions  insn_per_cycle  ( +-  0.00% )  (50.01%)
        68,396,969      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  0.42% )  (49.99%)

       # Table of individual measurements:
       3.906455589 (-0.000590652) #
       3.907223968 (+0.000177727) #
       3.906807137 (-0.000239104) #
       3.906487178 (-0.000559063) #
       3.906434480 (-0.000611761) #
       3.906919758 (-0.000126483) #
       3.905173921 (-0.001872320) #
       3.907695921 (+0.000649680) #
       3.906837725 (-0.000208516) #
       3.905805463 (-0.001240778) #
       3.908424103 (+0.001377862) #
       3.908511066 (+0.001464825) #
       3.909588182 (+0.002541941) #
       3.906859204 (-0.000187037) #
       3.906405105 (-0.000641136) #
       3.905907032 (-0.001139209) #
       3.907825693 (+0.000779452) #
       3.906864104 (-0.000182137) #
       3.905903436 (-0.001142805) #
       3.908795749 (+0.001749508) #

       # Final result:
       3.907046241 +- 0.000250831 seconds time elapsed  ( +-  0.01% )

```

## square_test cpp
```txt
# started on Tue Jun 16 23:00:29 2026


 Performance counter stats for './cpp-square_test' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
               132      page-faults:u                    #     33.8 faults/sec  page_faults_per_second  ( +-  0.18% )
          3,906.33 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
         9,891,794      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  0.03% )  (49.99%)
    21,095,980,445      branches:u                       #   5400.5 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
    21,496,604,328      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.00% )  (66.66%)
    84,446,762,277      instructions:u                   #      3.9 instructions  insn_per_cycle  ( +-  0.00% )  (50.01%)
        76,184,497      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  0.89% )  (50.00%)

       # Table of individual measurements:
       3.907637821 (+0.000621877) #
       3.904951725 (-0.002064219) #
       3.906612904 (-0.000403040) #
       3.908290433 (+0.001274489) #
       3.907566368 (+0.000550424) #
       3.905246186 (-0.001769758) #
       3.908065272 (+0.001049328) #
       3.907652579 (+0.000636635) #
       3.907548384 (+0.000532440) #
       3.906547842 (-0.000468102) #
       3.907662348 (+0.000646404) #
       3.908091801 (+0.001075857) #
       3.906856490 (-0.000159454) #
       3.906546008 (-0.000469936) #
       3.905311097 (-0.001704847) #
       3.907882329 (+0.000866385) #
       3.906474866 (-0.000541078) #
       3.907396460 (+0.000380516) #
       3.907799755 (+0.000783811) #
       3.906178221 (-0.000837723) #

       # Final result:
       3.907015944 +- 0.000224258 seconds time elapsed  ( +-  0.01% )

```

## square_test-defensive cpp
```txt
# started on Tue Jun 16 23:01:48 2026


 Performance counter stats for './cpp-square_test-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
               132      page-faults:u                    #     33.8 faults/sec  page_faults_per_second  ( +-  0.19% )
          3,908.51 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
         9,889,269      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  0.03% )  (49.98%)
    21,097,254,393      branches:u                       #   5397.8 M/sec  branch_frequency     ( +-  0.00% )  (50.01%)
    21,509,021,076      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.01% )  (66.69%)
    84,442,920,053      instructions:u                   #      3.9 instructions  insn_per_cycle  ( +-  0.00% )  (50.02%)
        76,917,732      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  1.14% )  (49.99%)

       # Table of individual measurements:
       3.909383319 (+0.000207980) #
       3.908955989 (-0.000219350) #
       3.909037432 (-0.000137907) #
       3.913189582 (+0.004014243) #
       3.908973772 (-0.000201567) #
       3.908657380 (-0.000517959) #
       3.906691461 (-0.002483878) #
       3.908265156 (-0.000910183) #
       3.906552220 (-0.002623119) #
       3.908607026 (-0.000568313) #
       3.911274859 (+0.002099520) #
       3.911011637 (+0.001836298) #
       3.910462378 (+0.001287039) #
       3.908555369 (-0.000619970) #
       3.909014328 (-0.000161011) #
       3.908634878 (-0.000540461) #
       3.911074564 (+0.001899225) #
       3.908326952 (-0.000848387) #
       3.908507419 (-0.000667920) #
       3.908331060 (-0.000844279) #

       # Final result:
       3.909175339 +- 0.000349284 seconds time elapsed  ( +-  0.01% )

```

