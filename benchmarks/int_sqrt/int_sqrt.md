# Benchmark Results: int_sqrt

## int_sqrt
```txt
# started on Tue Jun 16 12:38:37 2026


 Performance counter stats for './int_sqrt' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      7.9 faults/sec  page_faults_per_second  ( +-  0.19% )
          7,627.47 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
           149,868      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  0.56% )  (49.99%)
    13,410,882,052      branches:u                       #   1758.2 M/sec  branch_frequency     ( +-  0.00% )  (49.99%)
    41,929,426,303      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.00% )  (66.66%)
   121,530,489,226      instructions:u                   #      2.9 instructions  insn_per_cycle  ( +-  0.00% )  (50.01%)
         7,888,949      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  0.68% )  (50.01%)

       # Table of individual measurements:
       7.628298875 (-0.000294314) #
       7.630322723 (+0.001729534) #
       7.627701346 (-0.000891843) #
       7.634678836 (+0.006085647) #
       7.630483333 (+0.001890144) #
       7.627800422 (-0.000792767) #
       7.628549654 (-0.000043535) #
       7.632276480 (+0.003683291) #
       7.631063289 (+0.002470100) #
       7.628209508 (-0.000383681) #
       7.625958114 (-0.002635075) #
       7.628435140 (-0.000158049) #
       7.627216699 (-0.001376490) #
       7.627479551 (-0.001113638) #
       7.626831008 (-0.001762181) #
       7.626440657 (-0.002152532) #
       7.627520358 (-0.001072831) #
       7.628818708 (+0.000225519) #
       7.626862737 (-0.001730452) #
       7.626916338 (-0.001676851) #

       # Final result:
       7.628593189 +- 0.000486061 seconds time elapsed  ( +-  0.01% )

```

## int_sqrt-defensive
```txt
# started on Tue Jun 16 12:41:09 2026


 Performance counter stats for './int_sqrt-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      7.9 faults/sec  page_faults_per_second  ( +-  0.28% )
          7,642.95 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
           156,003      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  0.36% )  (49.99%)
    13,310,618,621      branches:u                       #   1741.6 M/sec  branch_frequency     ( +-  0.00% )  (49.99%)
    42,011,742,874      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.00% )  (66.66%)
   123,854,467,197      instructions:u                   #      2.9 instructions  insn_per_cycle  ( +-  0.00% )  (50.01%)
         7,839,300      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  0.26% )  (50.01%)

       # Table of individual measurements:
       7.641277004 (-0.002950042) #
       7.643775560 (-0.000451486) #
       7.640331916 (-0.003895130) #
       7.641288375 (-0.002938671) #
       7.643421158 (-0.000805888) #
       7.647175754 (+0.002948708) #
       7.647205249 (+0.002978203) #
       7.649515082 (+0.005288036) #
       7.646892724 (+0.002665678) #
       7.642127025 (-0.002100021) #
       7.641105834 (-0.003121212) #
       7.638946713 (-0.005280333) #
       7.644464379 (+0.000237333) #
       7.641554985 (-0.002672061) #
       7.646879229 (+0.002652183) #
       7.645210546 (+0.000983500) #
       7.644645288 (+0.000418242) #
       7.642649594 (-0.001577452) #
       7.645128082 (+0.000901036) #
       7.650946421 (+0.006719375) #

       # Final result:
       7.644227046 +- 0.000710549 seconds time elapsed  ( +-  0.01% )

```

## int_sqrt cpp
```txt
# started on Tue Jun 16 12:43:43 2026


 Performance counter stats for './cpp-int_sqrt' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
               132      page-faults:u                    #     47.9 faults/sec  page_faults_per_second  ( +-  0.15% )
          2,753.88 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.02% )
           120,425      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  2.55% )  (49.95%)
    11,981,082,739      branches:u                       #   4350.6 M/sec  branch_frequency     ( +-  0.01% )  (49.99%)
    15,132,358,756      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.01% )  (66.67%)
    50,759,070,341      instructions:u                   #      3.4 instructions  insn_per_cycle  ( +-  0.01% )  (50.05%)
        60,637,468      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  1.79% )  (50.01%)

       # Table of individual measurements:
       2.757334456 (+0.002687163) #
       2.755505253 (+0.000857960) #
       2.754692211 (+0.000044918) #
       2.759576703 (+0.004929410) #
       2.755259533 (+0.000612240) #
       2.752537900 (-0.002109393) #
       2.753338157 (-0.001309136) #
       2.752878737 (-0.001768556) #
       2.755792912 (+0.001145619) #
       2.752410781 (-0.002236512) #
       2.761794043 (+0.007146750) #
       2.752955331 (-0.001691962) #
       2.752401063 (-0.002246230) #
       2.755534688 (+0.000887395) #
       2.756063818 (+0.001416525) #
       2.752773049 (-0.001874244) #
       2.752519615 (-0.002127678) #
       2.755050833 (+0.000403540) #
       2.753265702 (-0.001381591) #
       2.751261070 (-0.003386223) #

       # Final result:
       2.754647293 +- 0.000588474 seconds time elapsed  ( +-  0.02% )

```

## int_sqrt-defensive cpp
```txt
# started on Tue Jun 16 12:44:38 2026


 Performance counter stats for './cpp-int_sqrt-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
               132      page-faults:u                    #     47.9 faults/sec  page_faults_per_second  ( +-  0.18% )
          2,754.86 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.02% )
           122,644      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  2.33% )  (50.00%)
    11,981,526,978      branches:u                       #   4349.2 M/sec  branch_frequency     ( +-  0.01% )  (49.99%)
    15,134,573,005      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.01% )  (66.66%)
    50,771,268,452      instructions:u                   #      3.4 instructions  insn_per_cycle  ( +-  0.01% )  (50.00%)
        62,514,406      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  2.07% )  (50.01%)

       # Table of individual measurements:
       2.754267857 (-0.001432589) #
       2.751878605 (-0.003821841) #
       2.756141765 (+0.000441319) #
       2.755899029 (+0.000198583) #
       2.754917152 (-0.000783294) #
       2.754432685 (-0.001267761) #
       2.758783398 (+0.003082952) #
       2.755027268 (-0.000673178) #
       2.756609449 (+0.000909003) #
       2.752295345 (-0.003405101) #
       2.756436205 (+0.000735759) #
       2.756460260 (+0.000759814) #
       2.763187621 (+0.007487175) #
       2.759068031 (+0.003367585) #
       2.758717235 (+0.003016789) #
       2.754559062 (-0.001141384) #
       2.753057541 (-0.002642905) #
       2.752391284 (-0.003309162) #
       2.755607354 (-0.000093092) #
       2.754271764 (-0.001428682) #

       # Final result:
       2.755700446 +- 0.000607841 seconds time elapsed  ( +-  0.02% )

```

