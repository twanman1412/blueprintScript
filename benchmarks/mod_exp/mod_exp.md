# Benchmark Results: mod_exp

## mod_exp
```txt
# started on Tue Jun 16 22:01:39 2026


 Performance counter stats for './mod_exp' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #     14.3 faults/sec  page_faults_per_second  ( +-  0.23% )
          4,193.82 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.03% )
       945,726,578      branch-misses:u                  #     20.3 %  branch_miss_rate         ( +-  0.02% )  (49.98%)
     4,660,241,448      branches:u                       #   1111.2 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
    23,069,271,755      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.03% )  (66.67%)
    32,700,734,313      instructions:u                   #      1.4 instructions  insn_per_cycle  ( +-  0.00% )  (50.02%)
     6,570,096,101      stalled-cycles-frontend:u        #     0.28 frontend_cycles_idle        ( +-  0.25% )  (50.00%)

       # Table of individual measurements:
       4.197249688 (+0.002721507) #
       4.181672375 (-0.012855806) #
       4.193082309 (-0.001445872) #
       4.196889034 (+0.002360853) #
       4.199460557 (+0.004932376) #
       4.199988434 (+0.005460253) #
       4.200038207 (+0.005510026) #
       4.197898504 (+0.003370323) #
       4.189726418 (-0.004801763) #
       4.190558987 (-0.003969194) #
       4.199039699 (+0.004511518) #
       4.197790702 (+0.003262521) #
       4.190488375 (-0.004039806) #
       4.191197502 (-0.003330679) #
       4.191205747 (-0.003322434) #
       4.201683978 (+0.007155797) #
       4.193234975 (-0.001293206) #
       4.189351967 (-0.005176214) #
       4.189701683 (-0.004826498) #
       4.200304476 (+0.005776295) #

       # Final result:
       4.194528181 +- 0.001170692 seconds time elapsed  ( +-  0.03% )

```

## mod_exp-defensive
```txt
# started on Tue Jun 16 22:03:03 2026


 Performance counter stats for './mod_exp-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #     13.5 faults/sec  page_faults_per_second  ( +-  0.22% )
          4,443.07 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
       948,005,731      branch-misses:u                  #     20.5 %  branch_miss_rate         ( +-  0.01% )  (49.99%)
     4,630,430,369      branches:u                       #   1042.2 M/sec  branch_frequency     ( +-  0.00% )  (50.01%)
    24,440,191,602      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.01% )  (66.68%)
    35,226,527,475      instructions:u                   #      1.4 instructions  insn_per_cycle  ( +-  0.00% )  (50.01%)
     6,348,353,668      stalled-cycles-frontend:u        #     0.26 frontend_cycles_idle        ( +-  0.06% )  (49.99%)

       # Table of individual measurements:
       4.443686612 (-0.000166451) #
       4.443371662 (-0.000481401) #
       4.442877206 (-0.000975857) #
       4.443346094 (-0.000506969) #
       4.446916406 (+0.003063343) #
       4.445842577 (+0.001989514) #
       4.437428619 (-0.006424444) #
       4.443894160 (+0.000041097) #
       4.444541040 (+0.000687977) #
       4.446028274 (+0.002175211) #
       4.441543550 (-0.002309513) #
       4.442938041 (-0.000915022) #
       4.438095287 (-0.005757776) #
       4.446025238 (+0.002172175) #
       4.444666104 (+0.000813041) #
       4.445093595 (+0.001240532) #
       4.444683207 (+0.000830144) #
       4.445943024 (+0.002089961) #
       4.444003103 (+0.000150040) #
       4.446137458 (+0.002284395) #

       # Final result:
       4.443853063 +- 0.000556848 seconds time elapsed  ( +-  0.01% )

```

## mod_exp cpp
```txt
# started on Tue Jun 16 22:04:32 2026


 Performance counter stats for './cpp-mod_exp' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
               132      page-faults:u                    #     30.5 faults/sec  page_faults_per_second  ( +-  0.12% )
          4,325.95 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
       944,806,234      branch-misses:u                  #     20.2 %  branch_miss_rate         ( +-  0.00% )  (49.99%)
     4,676,955,490      branches:u                       #   1081.1 M/sec  branch_frequency     ( +-  0.00% )  (50.01%)
    23,799,780,735      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.01% )  (66.67%)
    34,572,096,281      instructions:u                   #      1.5 instructions  insn_per_cycle  ( +-  0.00% )  (50.01%)
     6,724,779,062      stalled-cycles-frontend:u        #     0.28 frontend_cycles_idle        ( +-  0.01% )  (49.99%)

       # Table of individual measurements:
       4.328124079 (+0.001443362) #
       4.325842759 (-0.000837958) #
       4.326251564 (-0.000429153) #
       4.326985869 (+0.000305152) #
       4.327037174 (+0.000356457) #
       4.326459102 (-0.000221615) #
       4.327840327 (+0.001159610) #
       4.327385146 (+0.000704429) #
       4.326542769 (-0.000137948) #
       4.323935059 (-0.002745658) #
       4.326998803 (+0.000318086) #
       4.321946718 (-0.004733999) #
       4.325566602 (-0.001114115) #
       4.327640443 (+0.000959726) #
       4.327908836 (+0.001228119) #
       4.326526589 (-0.000154128) #
       4.327629382 (+0.000948665) #
       4.324704128 (-0.001976589) #
       4.330743471 (+0.004062754) #
       4.327545525 (+0.000864808) #

       # Final result:
       4.326680717 +- 0.000400344 seconds time elapsed  ( +-  0.01% )

```

## mod_exp-defensive cpp
```txt
# started on Tue Jun 16 22:05:59 2026


 Performance counter stats for './cpp-mod_exp-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
               132      page-faults:u                    #     29.7 faults/sec  page_faults_per_second  ( +-  0.18% )
          4,443.59 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.14% )
       944,484,217      branch-misses:u                  #     15.8 %  branch_miss_rate         ( +-  0.09% )  (50.01%)
     5,969,646,012      branches:u                       #   1343.4 M/sec  branch_frequency     ( +-  0.00% )  (50.01%)
    24,448,022,555      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.14% )  (66.67%)
    25,757,206,164      instructions:u                   #      1.1 instructions  insn_per_cycle  ( +-  0.00% )  (49.99%)
     8,222,088,993      stalled-cycles-frontend:u        #     0.34 frontend_cycles_idle        ( +-  0.22% )  (49.99%)

       # Table of individual measurements:
       4.430275973 (-0.014025832) #
       4.493404912 (+0.049103107) #
       4.429329721 (-0.014972084) #
       4.461053515 (+0.016751710) #
       4.430282375 (-0.014019430) #
       4.496597237 (+0.052295432) #
       4.430008231 (-0.014293574) #
       4.428583786 (-0.015718019) #
       4.450922414 (+0.006620609) #
       4.518284946 (+0.073983141) #
       4.427396894 (-0.016904911) #
       4.455698061 (+0.011396256) #
       4.430282144 (-0.014019661) #
       4.432100657 (-0.012201148) #
       4.429037244 (-0.015264561) #
       4.429375687 (-0.014926118) #
       4.428927979 (-0.015373826) #
       4.428101623 (-0.016200182) #
       4.427464611 (-0.016837194) #
       4.428908082 (-0.015393723) #

       # Final result:
       4.444301805 +- 0.006123467 seconds time elapsed  ( +-  0.14% )

```

