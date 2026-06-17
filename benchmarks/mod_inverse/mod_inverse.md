# Benchmark Results: mod_inverse

## mod_inverse
```txt
# started on Tue Jun 16 22:07:28 2026


 Performance counter stats for './mod_inverse' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      9.4 faults/sec  page_faults_per_second  ( +-  0.26% )
          6,354.52 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.03% )
     1,399,657,232      branch-misses:u                  #     20.6 %  branch_miss_rate         ( +-  0.06% )  (49.99%)
     6,787,359,062      branches:u                       #   1068.1 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
    34,963,096,653      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.03% )  (66.66%)
    48,303,122,859      instructions:u                   #      1.4 instructions  insn_per_cycle  ( +-  0.00% )  (50.01%)
    10,018,618,739      stalled-cycles-frontend:u        #     0.29 frontend_cycles_idle        ( +-  0.19% )  (50.00%)

       # Table of individual measurements:
       6.345848248 (-0.009485933) #
       6.364873966 (+0.009539785) #
       6.343312842 (-0.012021339) #
       6.347249630 (-0.008084551) #
       6.351319717 (-0.004014464) #
       6.361968387 (+0.006634206) #
       6.355375638 (+0.000041457) #
       6.348404672 (-0.006929509) #
       6.366834976 (+0.011500795) #
       6.365680955 (+0.010346774) #
       6.356620408 (+0.001286227) #
       6.356595441 (+0.001261260) #
       6.364350155 (+0.009015974) #
       6.359721662 (+0.004387481) #
       6.347609433 (-0.007724748) #
       6.354778220 (-0.000555961) #
       6.347852859 (-0.007481322) #
       6.358630770 (+0.003296589) #
       6.359505417 (+0.004171236) #
       6.350150229 (-0.005183952) #

       # Final result:
       6.355334181 +- 0.001632893 seconds time elapsed  ( +-  0.03% )

```

## mod_inverse-defensive
```txt
# started on Tue Jun 16 22:09:36 2026


 Performance counter stats for './mod_inverse-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      9.1 faults/sec  page_faults_per_second  ( +-  0.28% )
          6,616.91 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
     1,388,691,840      branch-misses:u                  #     20.6 %  branch_miss_rate         ( +-  0.02% )  (49.99%)
     6,727,477,655      branches:u                       #   1016.7 M/sec  branch_frequency     ( +-  0.00% )  (50.01%)
    36,404,257,810      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.01% )  (66.67%)
    51,930,090,543      instructions:u                   #      1.4 instructions  insn_per_cycle  ( +-  0.00% )  (50.01%)
     9,542,522,286      stalled-cycles-frontend:u        #     0.26 frontend_cycles_idle        ( +-  0.07% )  (49.99%)

       # Table of individual measurements:
       6.620784959 (+0.003066992) #
       6.614370123 (-0.003347844) #
       6.620924960 (+0.003206993) #
       6.617374376 (-0.000343591) #
       6.618238132 (+0.000520165) #
       6.614168936 (-0.003549031) #
       6.616416593 (-0.001301374) #
       6.617574661 (-0.000143306) #
       6.617138184 (-0.000579783) #
       6.618665362 (+0.000947395) #
       6.619580986 (+0.001863019) #
       6.609705092 (-0.008012875) #
       6.621433342 (+0.003715375) #
       6.619235790 (+0.001517823) #
       6.617285941 (-0.000432026) #
       6.612410034 (-0.005307933) #
       6.622210306 (+0.004492339) #
       6.619653942 (+0.001935975) #
       6.617756742 (+0.000038775) #
       6.619430885 (+0.001712918) #

       # Final result:
       6.617717967 +- 0.000699326 seconds time elapsed  ( +-  0.01% )

```

## mod_inverse cpp
```txt
# started on Tue Jun 16 22:11:49 2026


 Performance counter stats for './cpp-mod_inverse' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
               132      page-faults:u                    #     20.3 faults/sec  page_faults_per_second  ( +-  0.19% )
          6,515.04 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
     1,394,554,289      branch-misses:u                  #     20.5 %  branch_miss_rate         ( +-  0.02% )  (49.99%)
     6,787,966,690      branches:u                       #   1041.9 M/sec  branch_frequency     ( +-  0.00% )  (50.01%)
    35,844,880,214      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.01% )  (66.67%)
    52,263,223,417      instructions:u                   #      1.5 instructions  insn_per_cycle  ( +-  0.00% )  (50.01%)
     9,213,245,659      stalled-cycles-frontend:u        #     0.26 frontend_cycles_idle        ( +-  0.13% )  (49.99%)

       # Table of individual measurements:
       6.518303348 (+0.002271431) #
       6.518423984 (+0.002392067) #
       6.509058265 (-0.006973652) #
       6.517369421 (+0.001337504) #
       6.516464726 (+0.000432809) #
       6.515965743 (-0.000066174) #
       6.518364202 (+0.002332285) #
       6.517537775 (+0.001505858) #
       6.516140049 (+0.000108132) #
       6.517586907 (+0.001554990) #
       6.515557058 (-0.000474859) #
       6.507774643 (-0.008257274) #
       6.518581789 (+0.002549872) #
       6.514836059 (-0.001195858) #
       6.515374256 (-0.000657661) #
       6.516871348 (+0.000839431) #
       6.515664269 (-0.000367648) #
       6.517050654 (+0.001018737) #
       6.516390127 (+0.000358210) #
       6.517323715 (+0.001291798) #

       # Final result:
       6.516031917 +- 0.000632618 seconds time elapsed  ( +-  0.01% )

```

## mod_inverse-defensive cpp
```txt
# started on Tue Jun 16 22:14:00 2026


 Performance counter stats for './cpp-mod_inverse-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
               132      page-faults:u                    #     20.3 faults/sec  page_faults_per_second  ( +-  0.17% )
          6,511.43 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.02% )
     1,392,848,770      branch-misses:u                  #     14.8 %  branch_miss_rate         ( +-  0.01% )  (49.99%)
     9,387,005,056      branches:u                       #   1441.6 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
    35,826,984,769      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.02% )  (66.68%)
    51,033,574,174      instructions:u                   #      1.4 instructions  insn_per_cycle  ( +-  0.00% )  (50.01%)
    10,039,526,913      stalled-cycles-frontend:u        #     0.28 frontend_cycles_idle        ( +-  0.06% )  (50.00%)

       # Table of individual measurements:
       6.513083659 (+0.000774046) #
       6.510761864 (-0.001547749) #
       6.510731156 (-0.001578457) #
       6.510343280 (-0.001966333) #
       6.541274820 (+0.028965207) #
       6.512200336 (-0.000109277) #
       6.509349971 (-0.002959642) #
       6.510423470 (-0.001886143) #
       6.510235749 (-0.002073864) #
       6.511335467 (-0.000974146) #
       6.509091808 (-0.003217805) #
       6.509673667 (-0.002635946) #
       6.509874233 (-0.002435380) #
       6.511752598 (-0.000557015) #
       6.511311983 (-0.000997630) #
       6.511738361 (-0.000571252) #
       6.509189972 (-0.003119641) #
       6.510400387 (-0.001909226) #
       6.510480076 (-0.001829537) #
       6.512939399 (+0.000629786) #

       # Final result:
       6.512309613 +- 0.001545708 seconds time elapsed  ( +-  0.02% )

```

