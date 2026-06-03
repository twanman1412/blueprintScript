# Benchmark Results: bbs_bits

## bbs_bits
```txt
# started on Wed Jun  3 13:54:52 2026


 Performance counter stats for './bbs_bits' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      4.7 faults/sec  page_faults_per_second  ( +-  0.42% )
         12,740.44 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.07% )
     2,084,176,814      branch-misses:u                  #     26.1 %  branch_miss_rate         ( +-  0.00% )  (50.01%)
     7,980,584,584      branches:u                       #    626.4 M/sec  branch_frequency     ( +-  0.00% )  (50.01%)
    69,324,986,976      cpu-cycles:u                     #      5.4 GHz  cycles_frequency       ( +-  0.00% )  (66.67%)
   118,206,617,931      instructions:u                   #      1.7 instructions  insn_per_cycle  ( +-  0.00% )  (49.99%)
    13,505,739,411      stalled-cycles-frontend:u        #     0.19 frontend_cycles_idle        ( +-  0.02% )  (49.99%)

      # Table of individual measurements:
      12.838029665 (+0.096126885) #
      12.767801403 (+0.025898623) #
      12.714693738 (-0.027209042) #
      12.735042483 (-0.006860297) #
      12.778716420 (+0.036813640) #
      12.712919385 (-0.028983395) #
      12.710942526 (-0.030960254) #
      12.703913441 (-0.037989339) #
      12.706977222 (-0.034925558) #
      12.729158969 (-0.012743811) #
      12.714090448 (-0.027812332) #
      12.705146382 (-0.036756398) #
      12.705061546 (-0.036841234) #
      12.717935033 (-0.023967747) #
      12.740361193 (-0.001541587) #
      12.781403860 (+0.039501080) #
      12.729401161 (-0.012501619) #
      12.788353461 (+0.046450681) #
      12.792317890 (+0.050415110) #
      12.765789375 (+0.023886595) #

      # Final result:
      12.741902780 +- 0.008541374 seconds time elapsed  ( +-  0.07% )

```

## bbs_bits-defensive
```txt
# started on Wed Jun  3 13:59:07 2026


 Performance counter stats for './bbs_bits-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      4.7 faults/sec  page_faults_per_second  ( +-  0.37% )
         12,812.59 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.06% )
     2,083,722,907      branch-misses:u                  #     26.1 %  branch_miss_rate         ( +-  0.02% )  (50.00%)
     7,980,736,597      branches:u                       #    622.9 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
    69,733,391,849      cpu-cycles:u                     #      5.4 GHz  cycles_frequency       ( +-  0.01% )  (66.66%)
   118,794,474,622      instructions:u                   #      1.7 instructions  insn_per_cycle  ( +-  0.00% )  (50.00%)
    12,613,220,652      stalled-cycles-frontend:u        #     0.18 frontend_cycles_idle        ( +-  0.03% )  (50.00%)

      # Table of individual measurements:
      12.857863769 (+0.043719498) #
      12.806535010 (-0.007609261) #
      12.781866304 (-0.032277967) #
      12.796524114 (-0.017620157) #
      12.780138136 (-0.034006135) #
      12.777863215 (-0.036281056) #
      12.778600408 (-0.035543863) #
      12.778306501 (-0.035837770) #
      12.781050025 (-0.033094246) #
      12.793504010 (-0.020640261) #
      12.832569120 (+0.018424849) #
      12.860534048 (+0.046389777) #
      12.795234586 (-0.018909685) #
      12.823016121 (+0.008871850) #
      12.832126100 (+0.017981829) #
      12.855078390 (+0.040934119) #
      12.805385612 (-0.008758659) #
      12.827450807 (+0.013306536) #
      12.848990791 (+0.034846520) #
      12.870248357 (+0.056104086) #

      # Final result:
      12.814144271 +- 0.007146175 seconds time elapsed  ( +-  0.06% )

```

