# Benchmark Results: mod_exp

## mod_exp
```txt
# started on Wed Jun  3 14:15:10 2026


 Performance counter stats for './mod_exp' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #     10.8 faults/sec  page_faults_per_second  ( +-  0.36% )
          5,561.86 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.05% )
       943,912,905      branch-misses:u                  #     25.7 %  branch_miss_rate         ( +-  0.01% )  (49.99%)
     3,671,760,909      branches:u                       #    660.2 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
    30,246,256,904      cpu-cycles:u                     #      5.4 GHz  cycles_frequency       ( +-  0.01% )  (66.68%)
    55,709,158,925      instructions:u                   #      1.8 instructions  insn_per_cycle  ( +-  0.00% )  (50.01%)
     6,445,796,094      stalled-cycles-frontend:u        #     0.21 frontend_cycles_idle        ( +-  0.09% )  (50.00%)

       # Table of individual measurements:
       5.554644343 (-0.008019631) #
       5.562567789 (-0.000096185) #
       5.556397062 (-0.006266912) #
       5.580460348 (+0.017796374) #
       5.578087102 (+0.015423128) #
       5.574799417 (+0.012135443) #
       5.573575301 (+0.010911327) #
       5.575375312 (+0.012711338) #
       5.572958479 (+0.010294505) #
       5.562612760 (-0.000051214) #
       5.558601547 (-0.004062427) #
       5.541806160 (-0.020857814) #
       5.551431844 (-0.011232130) #
       5.561398428 (-0.001265546) #
       5.544287907 (-0.018376067) #
       5.541472320 (-0.021191654) #
       5.543116283 (-0.019547691) #
       5.568721731 (+0.006057757) #
       5.575294334 (+0.012630360) #
       5.575671007 (+0.013007033) #

       # Final result:
       5.562663974 +- 0.002949426 seconds time elapsed  ( +-  0.05% )

```

## mod_exp-defensive
```txt
# started on Wed Jun  3 14:17:01 2026


 Performance counter stats for './mod_exp-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #     10.7 faults/sec  page_faults_per_second  ( +-  0.35% )
          5,619.49 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.07% )
       944,913,184      branch-misses:u                  #     25.7 %  branch_miss_rate         ( +-  0.00% )  (49.98%)
     3,671,797,293      branches:u                       #    653.4 M/sec  branch_frequency     ( +-  0.00% )  (49.99%)
    30,580,642,103      cpu-cycles:u                     #      5.4 GHz  cycles_frequency       ( +-  0.01% )  (66.66%)
    58,653,686,339      instructions:u                   #      1.9 instructions  insn_per_cycle  ( +-  0.00% )  (50.02%)
     5,834,233,269      stalled-cycles-frontend:u        #     0.19 frontend_cycles_idle        ( +-  0.02% )  (50.01%)

       # Table of individual measurements:
       5.651298859 (+0.030864680) #
       5.637873259 (+0.017439080) #
       5.631887347 (+0.011453168) #
       5.645135947 (+0.024701768) #
       5.608284402 (-0.012149777) #
       5.604853078 (-0.015581101) #
       5.642179173 (+0.021744994) #
       5.631204227 (+0.010770048) #
       5.647787046 (+0.027352867) #
       5.642950153 (+0.022515974) #
       5.621808991 (+0.001374812) #
       5.604723020 (-0.015711159) #
       5.604456608 (-0.015977571) #
       5.606734930 (-0.013699249) #
       5.608849572 (-0.011584607) #
       5.607738407 (-0.012695772) #
       5.606132064 (-0.014302115) #
       5.604150998 (-0.016283181) #
       5.601744604 (-0.018689575) #
       5.598890892 (-0.021543287) #

       # Final result:
       5.620434179 +- 0.004136695 seconds time elapsed  ( +-  0.07% )

```

