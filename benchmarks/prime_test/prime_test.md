# Benchmark Results: prime_test

## prime_test
```txt
# started on Tue Jun 16 22:32:40 2026


 Performance counter stats for './prime_test' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      3.2 faults/sec  page_faults_per_second  ( +-  0.22% )
         18,877.12 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.00% )
        25,065,845      branch-misses:u                  #      0.1 %  branch_miss_rate         ( +-  0.02% )  (50.00%)
    17,248,138,256      branches:u                       #    913.7 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
   103,910,729,881      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.00% )  (66.67%)
    94,867,126,120      instructions:u                   #      0.9 instructions  insn_per_cycle  ( +-  0.00% )  (50.00%)
       219,740,957      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  0.08% )  (50.00%)

      # Table of individual measurements:
      18.880924297 (+0.002350612) #
      18.879707178 (+0.001133493) #
      18.881309387 (+0.002735702) #
      18.876223870 (-0.002349815) #
      18.877625362 (-0.000948323) #
      18.876762067 (-0.001811618) #
      18.878329361 (-0.000244324) #
      18.879265733 (+0.000692048) #
      18.877124355 (-0.001449330) #
      18.876030909 (-0.002542776) #
      18.876435967 (-0.002137718) #
      18.876274724 (-0.002298961) #
      18.877035709 (-0.001537976) #
      18.884707458 (+0.006133773) #
      18.882206657 (+0.003632972) #
      18.878990278 (+0.000416593) #
      18.879466428 (+0.000892743) #
      18.877501211 (-0.001072474) #
      18.878995737 (+0.000422052) #
      18.876557013 (-0.002016672) #

      # Final result:
      18.878573685 +- 0.000519387 seconds time elapsed  ( +-  0.00% )

```

## prime_test-defensive
```txt
# started on Tue Jun 16 22:38:57 2026


 Performance counter stats for './prime_test-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      3.2 faults/sec  page_faults_per_second  ( +-  0.29% )
         18,877.06 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.00% )
        25,055,506      branch-misses:u                  #      0.1 %  branch_miss_rate         ( +-  0.02% )  (50.00%)
    17,248,141,443      branches:u                       #    913.7 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
   103,910,211,590      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.00% )  (66.67%)
    94,868,231,356      instructions:u                   #      0.9 instructions  insn_per_cycle  ( +-  0.00% )  (50.00%)
       219,916,670      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  0.06% )  (50.00%)

      # Table of individual measurements:
      18.879463853 (+0.000904394) #
      18.881396921 (+0.002837462) #
      18.878480653 (-0.000078806) #
      18.880522825 (+0.001963366) #
      18.878279848 (-0.000279611) #
      18.875581838 (-0.002977621) #
      18.877707567 (-0.000851892) #
      18.877344316 (-0.001215143) #
      18.878937319 (+0.000377860) #
      18.877276309 (-0.001283150) #
      18.876074991 (-0.002484468) #
      18.876103234 (-0.002456225) #
      18.879375188 (+0.000815729) #
      18.878290758 (-0.000268701) #
      18.876506428 (-0.002053031) #
      18.884522531 (+0.005963072) #
      18.880017821 (+0.001458362) #
      18.879128766 (+0.000569307) #
      18.879467250 (+0.000907791) #
      18.876710761 (-0.001848698) #

      # Final result:
      18.878559459 +- 0.000473162 seconds time elapsed  ( +-  0.00% )

```

## prime_test cpp
```txt
# started on Tue Jun 16 22:45:16 2026


 Performance counter stats for './cpp-prime_test' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
               131      page-faults:u                    #      6.9 faults/sec  page_faults_per_second  ( +-  0.15% )
         18,879.78 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
        23,611,988      branch-misses:u                  #      0.1 %  branch_miss_rate         ( +-  3.11% )  (50.00%)
    17,400,624,620      branches:u                       #    921.7 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
   103,929,601,592      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.01% )  (66.66%)
    95,147,889,043      instructions:u                   #      0.9 instructions  insn_per_cycle  ( +-  0.00% )  (50.00%)
       181,265,458      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  3.86% )  (50.00%)

      # Table of individual measurements:
      18.878826961 (-0.002587064) #
      18.899488521 (+0.018074496) #
      18.877391265 (-0.004022760) #
      18.877580438 (-0.003833587) #
      18.877850484 (-0.003563541) #
      18.875740124 (-0.005673901) #
      18.873820531 (-0.007593494) #
      18.874419913 (-0.006994112) #
      18.875375673 (-0.006038352) #
      18.882402974 (+0.000988949) #
      18.876750225 (-0.004663800) #
      18.876297407 (-0.005116618) #
      18.873869123 (-0.007544902) #
      18.909873447 (+0.028459422) #
      18.876727412 (-0.004686613) #
      18.876716662 (-0.004697363) #
      18.911061350 (+0.029647325) #
      18.881115354 (-0.000298671) #
      18.877448391 (-0.003965634) #
      18.875524251 (-0.005889774) #

      # Final result:
      18.881414025 +- 0.002534739 seconds time elapsed  ( +-  0.01% )

```

## prime_test-defensive cpp
```txt
# started on Tue Jun 16 22:51:34 2026


 Performance counter stats for './cpp-prime_test-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
               132      page-faults:u                    #      7.0 faults/sec  page_faults_per_second  ( +-  0.18% )
         18,885.86 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.02% )
        23,940,195      branch-misses:u                  #      0.1 %  branch_miss_rate         ( +-  3.51% )  (49.99%)
    17,400,605,399      branches:u                       #    921.4 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
   103,971,133,807      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.02% )  (66.67%)
    95,147,452,887      instructions:u                   #      0.9 instructions  insn_per_cycle  ( +-  0.00% )  (50.01%)
       205,830,362      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  3.24% )  (50.00%)

      # Table of individual measurements:
      18.882415648 (-0.005053649) #
      18.882181079 (-0.005288218) #
      18.882217538 (-0.005251759) #
      18.879910088 (-0.007559209) #
      18.881546001 (-0.005923296) #
      18.915160161 (+0.027690864) #
      18.914445043 (+0.026975746) #
      18.881449811 (-0.006019486) #
      18.879414802 (-0.008054495) #
      18.914399508 (+0.026930211) #
      18.880910020 (-0.006559277) #
      18.878026283 (-0.009443014) #
      18.878825439 (-0.008643858) #
      18.879557499 (-0.007911798) #
      18.879187546 (-0.008281751) #
      18.878518905 (-0.008950392) #
      18.914998589 (+0.027529292) #
      18.879775447 (-0.007693850) #
      18.881393775 (-0.006075522) #
      18.885052753 (-0.002416544) #

      # Final result:
      18.887469297 +- 0.003150667 seconds time elapsed  ( +-  0.02% )

```

