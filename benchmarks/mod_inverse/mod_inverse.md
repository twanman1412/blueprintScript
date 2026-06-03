# Benchmark Results: mod_inverse

## mod_inverse
```txt
# started on Wed Jun  3 14:18:54 2026


 Performance counter stats for './mod_inverse' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      7.3 faults/sec  page_faults_per_second  ( +-  0.41% )
          8,247.94 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.07% )
     1,389,589,679      branch-misses:u                  #     26.0 %  branch_miss_rate         ( +-  0.01% )  (50.00%)
     5,346,791,168      branches:u                       #    648.3 M/sec  branch_frequency     ( +-  0.00% )  (49.99%)
    44,944,261,773      cpu-cycles:u                     #      5.4 GHz  cycles_frequency       ( +-  0.01% )  (66.66%)
    82,492,385,465      instructions:u                   #      1.8 instructions  insn_per_cycle  ( +-  0.00% )  (50.00%)
     9,155,013,422      stalled-cycles-frontend:u        #     0.20 frontend_cycles_idle        ( +-  0.11% )  (50.01%)

       # Table of individual measurements:
       8.235248833 (-0.014024528) #
       8.240074312 (-0.009199049) #
       8.236475349 (-0.012798012) #
       8.232750190 (-0.016523171) #
       8.244416143 (-0.004857218) #
       8.238806907 (-0.010466454) #
       8.236384618 (-0.012888743) #
       8.234517369 (-0.014755992) #
       8.236717972 (-0.012555389) #
       8.237579049 (-0.011694312) #
       8.238014522 (-0.011258839) #
       8.238818149 (-0.010455212) #
       8.237927064 (-0.011346297) #
       8.229680756 (-0.019592605) #
       8.225839108 (-0.023434253) #
       8.242658708 (-0.006614653) #
       8.303634048 (+0.054360687) #
       8.297636116 (+0.048362755) #
       8.294218916 (+0.044945555) #
       8.304069100 (+0.054795739) #

       # Final result:
       8.249273361 +- 0.005891078 seconds time elapsed  ( +-  0.07% )

```

## mod_inverse-defensive
```txt
# started on Wed Jun  3 14:21:39 2026


 Performance counter stats for './mod_inverse-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      7.2 faults/sec  page_faults_per_second  ( +-  0.37% )
          8,292.56 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.07% )
     1,390,973,382      branch-misses:u                  #     26.0 %  branch_miss_rate         ( +-  0.02% )  (49.98%)
     5,347,112,110      branches:u                       #    644.8 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
    44,940,219,682      cpu-cycles:u                     #      5.4 GHz  cycles_frequency       ( +-  0.01% )  (66.67%)
    86,408,386,655      instructions:u                   #      1.9 instructions  insn_per_cycle  ( +-  0.00% )  (50.02%)
     8,365,493,887      stalled-cycles-frontend:u        #     0.19 frontend_cycles_idle        ( +-  0.06% )  (50.00%)

       # Table of individual measurements:
       8.317263316 (+0.023635388) #
       8.315283128 (+0.021655200) #
       8.286730259 (-0.006897669) #
       8.307659114 (+0.014031186) #
       8.317738279 (+0.024110351) #
       8.308883208 (+0.015255280) #
       8.290750038 (-0.002877890) #
       8.291141177 (-0.002486751) #
       8.312845399 (+0.019217471) #
       8.311625831 (+0.017997903) #
       8.290964977 (-0.002662951) #
       8.301566733 (+0.007938805) #
       8.290053780 (-0.003574148) #
       8.302590501 (+0.008962573) #
       8.307355095 (+0.013727167) #
       8.307417421 (+0.013789493) #
       8.283271328 (-0.010356600) #
       8.249090399 (-0.044537529) #
       8.236614915 (-0.057013013) #
       8.243713671 (-0.049914257) #

       # Final result:
       8.293627928 +- 0.005421288 seconds time elapsed  ( +-  0.07% )

```

