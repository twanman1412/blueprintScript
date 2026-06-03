# Benchmark Results: naive_dlog

## naive_dlog
```txt
# started on Wed Jun  3 14:24:24 2026


 Performance counter stats for './naive_dlog' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      5.5 faults/sec  page_faults_per_second  ( +-  0.44% )
         10,928.07 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.04% )
           707,127      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  0.25% )  (49.99%)
    15,078,309,569      branches:u                       #   1379.8 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
    59,471,919,198      cpu-cycles:u                     #      5.4 GHz  cycles_frequency       ( +-  0.01% )  (66.67%)
   146,193,844,774      instructions:u                   #      2.5 instructions  insn_per_cycle  ( +-  0.00% )  (50.01%)
        20,270,724      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  4.42% )  (50.00%)

      # Table of individual measurements:
      10.907907207 (-0.021520141) #
      10.907401378 (-0.022025970) #
      10.907602346 (-0.021825002) #
      10.907737154 (-0.021690194) #
      10.939461005 (+0.010033657) #
      10.956959443 (+0.027532095) #
      10.922683230 (-0.006744118) #
      10.901606659 (-0.027820689) #
      10.950124134 (+0.020696786) #
      10.943030705 (+0.013603357) #
      10.936901345 (+0.007473997) #
      10.945000779 (+0.015573431) #
      10.953853810 (+0.024426462) #
      10.947086107 (+0.017658759) #
      10.948969586 (+0.019542238) #
      10.909484464 (-0.019942884) #
      10.927757399 (-0.001669949) #
      10.931940751 (+0.002513403) #
      10.934505591 (+0.005078243) #
      10.908533875 (-0.020893473) #

      # Final result:
      10.929427348 +- 0.004181587 seconds time elapsed  ( +-  0.04% )

```

## naive_dlog-defensive
```txt
# started on Wed Jun  3 14:28:03 2026


 Performance counter stats for './naive_dlog-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      4.5 faults/sec  page_faults_per_second  ( +-  0.31% )
         13,414.82 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.04% )
           704,044      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  0.38% )  (50.00%)
    10,078,259,661      branches:u                       #    751.3 M/sec  branch_frequency     ( +-  0.00% )  (50.01%)
    73,012,549,392      cpu-cycles:u                     #      5.4 GHz  cycles_frequency       ( +-  0.00% )  (66.67%)
   136,254,842,788      instructions:u                   #      1.9 instructions  insn_per_cycle  ( +-  0.00% )  (50.00%)
        22,396,423      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  3.76% )  (49.99%)

      # Table of individual measurements:
      13.379486513 (-0.036705163) #
      13.388919781 (-0.027271895) #
      13.389207732 (-0.026983944) #
      13.380609385 (-0.035582291) #
      13.414430442 (-0.001761234) #
      13.447474655 (+0.031282979) #
      13.436554591 (+0.020362915) #
      13.444265807 (+0.028074131) #
      13.426256740 (+0.010065064) #
      13.429027525 (+0.012835849) #
      13.437081459 (+0.020889783) #
      13.448849649 (+0.032657973) #
      13.378428986 (-0.037762690) #
      13.421253476 (+0.005061800) #
      13.437599690 (+0.021408014) #
      13.444873433 (+0.028681757) #
      13.388926533 (-0.027265143) #
      13.402995992 (-0.013195684) #
      13.434715362 (+0.018523686) #
      13.392875770 (-0.023315906) #

      # Final result:
      13.416191676 +- 0.005752721 seconds time elapsed  ( +-  0.04% )

```

