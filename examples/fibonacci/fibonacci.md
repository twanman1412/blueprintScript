# Benchmark Results: fibonacci

## fibonacci
```txt
# started on Wed Jun  3 14:03:23 2026


 Performance counter stats for './fibonacci' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      9.7 faults/sec  page_faults_per_second  ( +-  0.39% )
          6,161.10 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.09% )
         9,482,605      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  0.09% )  (49.95%)
    21,066,818,729      branches:u                       #   3419.3 M/sec  branch_frequency     ( +-  0.00% )  (49.97%)
    32,794,740,876      cpu-cycles:u                     #      5.3 GHz  cycles_frequency       ( +-  0.02% )  (66.65%)
   126,845,249,975      instructions:u                   #      3.9 instructions  insn_per_cycle  ( +-  0.00% )  (50.05%)
       286,394,156      stalled-cycles-frontend:u        #     0.01 frontend_cycles_idle        ( +-  0.51% )  (50.03%)

       # Table of individual measurements:
       6.176496528 (+0.014414640) #
       6.174257598 (+0.012175710) #
       6.180034588 (+0.017952700) #
       6.169096957 (+0.007015069) #
       6.168577330 (+0.006495442) #
       6.181420080 (+0.019338192) #
       6.180812208 (+0.018730320) #
       6.179157168 (+0.017075280) #
       6.189755070 (+0.027673182) #
       6.180777274 (+0.018695386) #
       6.182707427 (+0.020625539) #
       6.177424472 (+0.015342584) #
       6.122351569 (-0.039730319) #
       6.171399355 (+0.009317467) #
       6.120625752 (-0.041456136) #
       6.118836439 (-0.043245449) #
       6.117144604 (-0.044937284) #
       6.157021864 (-0.005060024) #
       6.118734464 (-0.043347424) #
       6.175007006 (+0.012925118) #

       # Final result:
       6.162081888 +- 0.005828093 seconds time elapsed  ( +-  0.09% )

```

## fibonacci-defensive
```txt
# started on Wed Jun  3 14:05:27 2026


 Performance counter stats for './fibonacci-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      4.4 faults/sec  page_faults_per_second  ( +-  0.35% )
         13,714.29 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.03% )
        15,511,154      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  0.08% )  (49.99%)
    34,788,648,603      branches:u                       #   2536.7 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
    74,461,064,809      cpu-cycles:u                     #      5.4 GHz  cycles_frequency       ( +-  0.01% )  (66.66%)
   226,852,250,311      instructions:u                   #      3.0 instructions  insn_per_cycle  ( +-  0.00% )  (50.01%)
       151,480,349      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  1.04% )  (50.00%)

      # Table of individual measurements:
      13.723107925 (+0.007219988) #
      13.727526717 (+0.011638780) #
      13.726524061 (+0.010636124) #
      13.721740045 (+0.005852108) #
      13.720253332 (+0.004365395) #
      13.714551080 (-0.001336857) #
      13.645782553 (-0.070105384) #
      13.689682034 (-0.026205903) #
      13.716284172 (+0.000396235) #
      13.729404995 (+0.013517058) #
      13.725240490 (+0.009352553) #
      13.726068610 (+0.010180673) #
      13.729870694 (+0.013982757) #
      13.704505153 (-0.011382784) #
      13.710813076 (-0.005074861) #
      13.728079524 (+0.012191587) #
      13.720926893 (+0.005038956) #
      13.718111576 (+0.002223639) #
      13.724068359 (+0.008180422) #
      13.715217445 (-0.000670492) #

      # Final result:
      13.715887937 +- 0.004269995 seconds time elapsed  ( +-  0.03% )

```

