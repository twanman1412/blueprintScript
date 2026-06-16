# Benchmark Results: fibonacci

## fibonacci
```txt
# started on Tue Jun 16 12:30:07 2026


 Performance counter stats for './fibonacci' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      9.9 faults/sec  page_faults_per_second  ( +-  0.25% )
          6,087.33 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.03% )
         9,422,089      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  0.01% )  (49.97%)
    21,065,951,918      branches:u                       #   3460.6 M/sec  branch_frequency     ( +-  0.00% )  (49.98%)
    32,774,243,163      cpu-cycles:u                     #      5.4 GHz  cycles_frequency       ( +-  0.00% )  (66.66%)
   126,855,023,799      instructions:u                   #      3.9 instructions  insn_per_cycle  ( +-  0.00% )  (50.03%)
       280,542,090      stalled-cycles-frontend:u        #     0.01 frontend_cycles_idle        ( +-  0.31% )  (50.02%)

       # Table of individual measurements:
       6.091710372 (+0.003381309) #
       6.085880622 (-0.002448441) #
       6.088937162 (+0.000608099) #
       6.100765790 (+0.012436727) #
       6.091079822 (+0.002750759) #
       6.091947176 (+0.003618113) #
       6.084611005 (-0.003718058) #
       6.093571115 (+0.005242052) #
       6.100754078 (+0.012425015) #
       6.092711747 (+0.004382684) #
       6.072832722 (-0.015496341) #
       6.091122191 (+0.002793128) #
       6.083278331 (-0.005050732) #
       6.090267862 (+0.001938799) #
       6.089380051 (+0.001050988) #
       6.064216907 (-0.024112156) #
       6.086675640 (-0.001653423) #
       6.088171039 (-0.000158024) #
       6.089936192 (+0.001607129) #
       6.088731437 (+0.000402374) #

       # Final result:
       6.088329063 +- 0.001830466 seconds time elapsed  ( +-  0.03% )

```

## fibonacci-defensive
```txt
# started on Tue Jun 16 12:32:09 2026


 Performance counter stats for './fibonacci-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      4.4 faults/sec  page_faults_per_second  ( +-  0.27% )
         13,582.76 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
        15,340,452      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  0.01% )  (49.99%)
    34,789,256,958      branches:u                       #   2561.3 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
    74,447,156,615      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.00% )  (66.66%)
   226,847,111,147      instructions:u                   #      3.0 instructions  insn_per_cycle  ( +-  0.00% )  (50.01%)
       141,310,372      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  1.13% )  (50.00%)

      # Table of individual measurements:
      13.585561449 (+0.001086876) #
      13.590351364 (+0.005876791) #
      13.593373199 (+0.008898626) #
      13.592347941 (+0.007873368) #
      13.590167310 (+0.005692737) #
      13.566181248 (-0.018293325) #
      13.583746393 (-0.000728180) #
      13.589215038 (+0.004740465) #
      13.591098222 (+0.006623649) #
      13.584466740 (-0.000007833) #
      13.595381319 (+0.010906746) #
      13.587194036 (+0.002719463) #
      13.583435020 (-0.001039553) #
      13.584903328 (+0.000428755) #
      13.592985153 (+0.008510580) #
      13.583126903 (-0.001347670) #
      13.581517681 (-0.002956892) #
      13.576199058 (-0.008275515) #
      13.575782127 (-0.008692446) #
      13.562457929 (-0.022016644) #

      # Final result:
      13.584474573 +- 0.001953542 seconds time elapsed  ( +-  0.01% )

```

## fibonacci cpp
```txt
# started on Tue Jun 16 12:36:41 2026


 Performance counter stats for './cpp-fibonacci' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
               132      page-faults:u                    #     44.5 faults/sec  page_faults_per_second  ( +-  0.13% )
          2,967.23 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.04% )
        13,281,567      branch-misses:u                  #      0.1 %  branch_miss_rate         ( +-  0.60% )  (50.00%)
    16,715,483,958      branches:u                       #   5633.4 M/sec  branch_frequency     ( +-  0.01% )  (50.03%)
    16,207,457,283      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.04% )  (66.69%)
    75,475,298,138      instructions:u                   #      4.7 instructions  insn_per_cycle  ( +-  0.01% )  (50.00%)
       229,762,581      stalled-cycles-frontend:u        #     0.01 frontend_cycles_idle        ( +-  0.52% )  (49.97%)

       # Table of individual measurements:
       2.965768403 (-0.002188196) #
       2.974534210 (+0.006577611) #
       2.965679427 (-0.002277172) #
       2.956641913 (-0.011314686) #
       2.972157742 (+0.004201143) #
       2.962558476 (-0.005398123) #
       2.966207165 (-0.001749434) #
       2.970677201 (+0.002720602) #
       2.961640298 (-0.006316301) #
       2.970054686 (+0.002098087) #
       2.965274269 (-0.002682330) #
       2.968794657 (+0.000838058) #
       2.967168514 (-0.000788085) #
       2.974251791 (+0.006295192) #
       2.962225433 (-0.005731166) #
       2.973019945 (+0.005063346) #
       2.975980496 (+0.008023897) #
       2.962133981 (-0.005822618) #
       2.972302994 (+0.004346395) #
       2.972060370 (+0.004103771) #

       # Final result:
       2.967956599 +- 0.001173680 seconds time elapsed  ( +-  0.04% )

```

## fibonacci-defensive cpp
```txt
# started on Tue Jun 16 12:37:41 2026


 Performance counter stats for './cpp-fibonacci-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
               131      page-faults:u                    #     46.8 faults/sec  page_faults_per_second  ( +-  0.17% )
          2,796.38 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.04% )
        12,412,119      branch-misses:u                  #      0.1 %  branch_miss_rate         ( +-  1.09% )  (50.01%)
    16,489,363,538      branches:u                       #   5896.7 M/sec  branch_frequency     ( +-  0.01% )  (49.97%)
    15,251,263,597      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.04% )  (66.64%)
    74,708,555,698      instructions:u                   #      4.9 instructions  insn_per_cycle  ( +-  0.01% )  (49.99%)
       106,058,253      stalled-cycles-frontend:u        #     0.01 frontend_cycles_idle        ( +-  1.25% )  (50.03%)

       # Table of individual measurements:
       2.800609519 (+0.003549092) #
       2.792946226 (-0.004114201) #
       2.802618498 (+0.005558071) #
       2.791096864 (-0.005963563) #
       2.796809466 (-0.000250961) #
       2.795979152 (-0.001081275) #
       2.806495445 (+0.009435018) #
       2.794791950 (-0.002268477) #
       2.792930226 (-0.004130201) #
       2.795254877 (-0.001805550) #
       2.799029201 (+0.001968774) #
       2.793927022 (-0.003133405) #
       2.793352466 (-0.003707961) #
       2.799468553 (+0.002408126) #
       2.791079502 (-0.005980925) #
       2.794865157 (-0.002195270) #
       2.792726034 (-0.004334393) #
       2.810722715 (+0.013662288) #
       2.799599297 (+0.002538870) #
       2.796906377 (-0.000154050) #

       # Final result:
       2.797060427 +- 0.001144142 seconds time elapsed  ( +-  0.04% )

```

