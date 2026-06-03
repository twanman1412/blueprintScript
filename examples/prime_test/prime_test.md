# Benchmark Results: prime_test

## prime_test
```txt
# started on Wed Jun  3 14:32:31 2026


 Performance counter stats for './prime_test' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      3.1 faults/sec  page_faults_per_second  ( +-  0.37% )
         19,211.38 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.04% )
        21,744,799      branch-misses:u                  #      0.1 %  branch_miss_rate         ( +-  0.04% )  (50.00%)
    26,022,078,322      branches:u                       #   1354.5 M/sec  branch_frequency     ( +-  0.00% )  (50.01%)
   104,683,758,040      cpu-cycles:u                     #      5.4 GHz  cycles_frequency       ( +-  0.00% )  (66.67%)
   182,012,174,216      instructions:u                   #      1.7 instructions  insn_per_cycle  ( +-  0.00% )  (50.00%)
       152,222,262      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  0.85% )  (49.99%)

      # Table of individual measurements:
      19.215176824 (+0.001923355) #
      19.242775540 (+0.029522071) #
      19.264340637 (+0.051087168) #
      19.291737186 (+0.078483717) #
      19.241223293 (+0.027969824) #
      19.219403940 (+0.006150471) #
      19.194950605 (-0.018302864) #
      19.191193530 (-0.022059939) #
      19.186466851 (-0.026786618) #
      19.186654507 (-0.026598962) #
      19.193158533 (-0.020094936) #
      19.266766847 (+0.053513378) #
      19.224937788 (+0.011684319) #
      19.214067252 (+0.000813783) #
      19.183946064 (-0.029307405) #
      19.197545053 (-0.015708416) #
      19.184102157 (-0.029151312) #
      19.184357007 (-0.028896462) #
      19.192273801 (-0.020979668) #
      19.189991959 (-0.023261510) #

      # Final result:
      19.213253469 +- 0.007234429 seconds time elapsed  ( +-  0.04% )

```

## prime_test-defensive
```txt
# started on Wed Jun  3 14:38:56 2026


 Performance counter stats for './prime_test-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      3.1 faults/sec  page_faults_per_second  ( +-  0.37% )
         19,230.05 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.04% )
        21,737,505      branch-misses:u                  #      0.1 %  branch_miss_rate         ( +-  0.04% )  (50.01%)
    26,022,333,495      branches:u                       #   1353.2 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
   104,692,087,122      cpu-cycles:u                     #      5.4 GHz  cycles_frequency       ( +-  0.00% )  (66.66%)
   182,013,239,227      instructions:u                   #      1.7 instructions  insn_per_cycle  ( +-  0.00% )  (49.99%)
       157,081,873      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  0.94% )  (50.00%)

      # Table of individual measurements:
      19.230170331 (-0.001802752) #
      19.196820994 (-0.035152089) #
      19.185724203 (-0.046248880) #
      19.227896880 (-0.004076203) #
      19.280139957 (+0.048166874) #
      19.187397406 (-0.044575677) #
      19.188662182 (-0.043310901) #
      19.209178294 (-0.022794789) #
      19.204538208 (-0.027434875) #
      19.282767967 (+0.050794884) #
      19.282005630 (+0.050032547) #
      19.217973312 (-0.013999771) #
      19.276509508 (+0.044536425) #
      19.232005207 (+0.000032124) #
      19.272061744 (+0.040088661) #
      19.189704579 (-0.042268504) #
      19.222744825 (-0.009228258) #
      19.233335329 (+0.001362246) #
      19.275711346 (+0.043738263) #
      19.244113759 (+0.012140676) #

      # Final result:
      19.231973083 +- 0.007889647 seconds time elapsed  ( +-  0.04% )

```

