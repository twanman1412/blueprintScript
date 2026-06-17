# Benchmark Results: int_sqrt

## int_sqrt
```txt
# started on Tue Jun 16 21:57:57 2026


 Performance counter stats for './int_sqrt' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #     21.8 faults/sec  page_faults_per_second  ( +-  0.19% )
          2,748.65 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
           154,722      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  0.64% )  (50.00%)
    10,326,490,476      branches:u                       #   3756.9 M/sec  branch_frequency     ( +-  0.00% )  (50.03%)
    15,122,635,392      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.00% )  (66.68%)
    39,695,010,756      instructions:u                   #      2.6 instructions  insn_per_cycle  ( +-  0.00% )  (50.00%)
         4,017,914      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  1.31% )  (49.97%)

       # Table of individual measurements:
       2.750208760 (+0.000925989) #
       2.748719352 (-0.000563419) #
       2.749376542 (+0.000093771) #
       2.748757244 (-0.000525527) #
       2.749321088 (+0.000038317) #
       2.749294669 (+0.000011898) #
       2.749288869 (+0.000006098) #
       2.748307562 (-0.000975209) #
       2.748503298 (-0.000779473) #
       2.748518767 (-0.000764004) #
       2.749069207 (-0.000213564) #
       2.748391469 (-0.000891302) #
       2.748584901 (-0.000697870) #
       2.749715757 (+0.000432986) #
       2.749586225 (+0.000303454) #
       2.749584491 (+0.000301720) #
       2.752537328 (+0.003254557) #
       2.750204693 (+0.000921922) #
       2.747980550 (-0.001302221) #
       2.749704656 (+0.000421885) #

       # Final result:
       2.749282771 +- 0.000221344 seconds time elapsed  ( +-  0.01% )

```

## int_sqrt-defensive
```txt
# started on Tue Jun 16 21:58:52 2026


 Performance counter stats for './int_sqrt-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #     21.8 faults/sec  page_faults_per_second  ( +-  0.27% )
          2,749.29 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.00% )
           223,726      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  0.68% )  (49.99%)
    10,202,260,779      branches:u                       #   3710.9 M/sec  branch_frequency     ( +-  0.00% )  (49.98%)
    15,124,833,732      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.00% )  (66.64%)
    39,419,560,681      instructions:u                   #      2.6 instructions  insn_per_cycle  ( +-  0.00% )  (50.01%)
         5,932,548      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  1.41% )  (50.02%)

       # Table of individual measurements:
       2.751558487 (+0.001666106) #
       2.750778056 (+0.000885675) #
       2.749132536 (-0.000759845) #
       2.749643702 (-0.000248679) #
       2.749922425 (+0.000030044) #
       2.749227082 (-0.000665299) #
       2.750411520 (+0.000519139) #
       2.750001081 (+0.000108700) #
       2.749897157 (+0.000004776) #
       2.749126014 (-0.000766367) #
       2.749686392 (-0.000205989) #
       2.748826203 (-0.001066178) #
       2.749418551 (-0.000473830) #
       2.749973510 (+0.000081129) #
       2.749875767 (-0.000016614) #
       2.749619908 (-0.000272473) #
       2.751051898 (+0.001159517) #
       2.749705178 (-0.000187203) #
       2.750351698 (+0.000459317) #
       2.749640457 (-0.000251924) #

       # Final result:
       2.749892381 +- 0.000150879 seconds time elapsed  ( +-  0.01% )

```

## int_sqrt cpp
```txt
# started on Tue Jun 16 21:59:48 2026


 Performance counter stats for './cpp-int_sqrt' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
               132      page-faults:u                    #     48.0 faults/sec  page_faults_per_second  ( +-  0.18% )
          2,748.92 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
           136,873      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  2.47% )  (50.00%)
    10,376,381,884      branches:u                       #   3774.7 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
    15,123,198,765      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.00% )  (66.67%)
    43,510,777,989      instructions:u                   #      2.9 instructions  insn_per_cycle  ( +-  0.00% )  (50.00%)
         3,531,500      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  1.88% )  (50.00%)

       # Table of individual measurements:
       2.751024197 (+0.001391582) #
       2.749695089 (+0.000062473) #
       2.749662277 (+0.000029662) #
       2.750879135 (+0.001246519) #
       2.750289171 (+0.000656555) #
       2.748663629 (-0.000968986) #
       2.749475157 (-0.000157458) #
       2.750537104 (+0.000904489) #
       2.748567068 (-0.001065548) #
       2.749782172 (+0.000149557) #
       2.750718585 (+0.001085970) #
       2.748481147 (-0.001151468) #
       2.748080768 (-0.001551848) #
       2.750385090 (+0.000752475) #
       2.749234046 (-0.000398569) #
       2.749340556 (-0.000292059) #
       2.750935029 (+0.001302413) #
       2.748653730 (-0.000978885) #
       2.749945126 (+0.000312511) #
       2.748303234 (-0.001329381) #

       # Final result:
       2.749632615 +- 0.000212188 seconds time elapsed  ( +-  0.01% )

```

## int_sqrt-defensive cpp
```txt
# started on Tue Jun 16 22:00:44 2026


 Performance counter stats for './cpp-int_sqrt-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
               132      page-faults:u                    #     48.0 faults/sec  page_faults_per_second  ( +-  0.18% )
          2,748.78 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.00% )
           129,860      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  2.06% )  (50.01%)
    10,277,180,454      branches:u                       #   3738.8 M/sec  branch_frequency     ( +-  0.00% )  (50.02%)
    15,123,522,738      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.00% )  (66.68%)
    39,596,000,284      instructions:u                   #      2.6 instructions  insn_per_cycle  ( +-  0.00% )  (49.99%)
         3,476,949      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  0.70% )  (49.98%)

       # Table of individual measurements:
       2.751915254 (+0.002495822) #
       2.749461742 (+0.000042310) #
       2.749388094 (-0.000031338) #
       2.749565707 (+0.000146275) #
       2.749550148 (+0.000130716) #
       2.750037009 (+0.000617577) #
       2.749474466 (+0.000055034) #
       2.749584241 (+0.000164809) #
       2.749353730 (-0.000065702) #
       2.749265464 (-0.000153968) #
       2.749606794 (+0.000187362) #
       2.749543435 (+0.000124003) #
       2.749171038 (-0.000248394) #
       2.749640927 (+0.000221495) #
       2.748556898 (-0.000862534) #
       2.748462562 (-0.000956870) #
       2.749310959 (-0.000108473) #
       2.749107890 (-0.000311542) #
       2.748064186 (-0.001355246) #
       2.749328092 (-0.000091340) #

       # Final result:
       2.749419432 +- 0.000166106 seconds time elapsed  ( +-  0.01% )

```

