# Benchmark Results: int_sqrt

## int_sqrt
```txt
# started on Wed Jun  3 14:10:01 2026


 Performance counter stats for './int_sqrt' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      7.8 faults/sec  page_faults_per_second  ( +-  0.35% )
          7,712.24 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.04% )
           177,945      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  1.74% )  (49.99%)
    13,410,615,452      branches:u                       #   1738.9 M/sec  branch_frequency     ( +-  0.01% )  (49.99%)
    41,951,897,474      cpu-cycles:u                     #      5.4 GHz  cycles_frequency       ( +-  0.01% )  (66.67%)
   121,542,237,666      instructions:u                   #      2.9 instructions  insn_per_cycle  ( +-  0.01% )  (50.01%)
        13,139,719      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  5.14% )  (50.01%)

       # Table of individual measurements:
       7.721113337 (+0.007783133) #
       7.719261328 (+0.005931123) #
       7.690587480 (-0.022742725) #
       7.722533303 (+0.009203098) #
       7.719732965 (+0.006402761) #
       7.724596860 (+0.011266656) #
       7.702831844 (-0.010498360) #
       7.730313045 (+0.016982840) #
       7.691383276 (-0.021946929) #
       7.690059500 (-0.023270704) #
       7.694189356 (-0.019140849) #
       7.715888749 (+0.002558545) #
       7.735342326 (+0.022012121) #
       7.738504635 (+0.025174430) #
       7.703574943 (-0.009755262) #
       7.710109456 (-0.003220749) #
       7.692151693 (-0.021178512) #
       7.711071601 (-0.002258603) #
       7.729702503 (+0.016372299) #
       7.723655890 (+0.010325685) #

       # Final result:
       7.713330205 +- 0.003521545 seconds time elapsed  ( +-  0.05% )

```

## int_sqrt-defensive
```txt
# started on Wed Jun  3 14:12:35 2026


 Performance counter stats for './int_sqrt-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      7.8 faults/sec  page_faults_per_second  ( +-  0.32% )
          7,723.17 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.05% )
           175,662      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  1.81% )  (49.98%)
    13,310,728,437      branches:u                       #   1723.5 M/sec  branch_frequency     ( +-  0.00% )  (49.98%)
    42,016,202,513      cpu-cycles:u                     #      5.4 GHz  cycles_frequency       ( +-  0.01% )  (66.69%)
   123,854,908,321      instructions:u                   #      2.9 instructions  insn_per_cycle  ( +-  0.00% )  (50.02%)
        10,061,663      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  4.02% )  (50.02%)

       # Table of individual measurements:
       7.732043854 (+0.007802219) #
       7.703636925 (-0.020604710) #
       7.707422132 (-0.016819503) #
       7.750122908 (+0.025881273) #
       7.734081350 (+0.009839715) #
       7.732255678 (+0.008014043) #
       7.736623949 (+0.012382314) #
       7.733993838 (+0.009752203) #
       7.738683092 (+0.014441457) #
       7.742895845 (+0.018654210) #
       7.740697518 (+0.016455883) #
       7.739083559 (+0.014841924) #
       7.742357823 (+0.018116188) #
       7.728464391 (+0.004222756) #
       7.711690894 (-0.012550741) #
       7.699005667 (-0.025235968) #
       7.707432666 (-0.016808969) #
       7.698192963 (-0.026048672) #
       7.706390646 (-0.017850989) #
       7.699757005 (-0.024484630) #

       # Final result:
       7.724241635 +- 0.003945312 seconds time elapsed  ( +-  0.05% )

```

