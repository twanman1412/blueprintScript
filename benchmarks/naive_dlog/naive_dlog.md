# Benchmark Results: naive_dlog

## naive_dlog
```txt
# started on Wed Jun 17 09:10:51 2026


 Performance counter stats for './naive_dlog' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      7.8 faults/sec  page_faults_per_second  ( +-  0.23% )
          7,663.01 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.06% )
           488,858      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  2.27% )  (50.00%)
    10,098,380,326      branches:u                       #   1317.8 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
    41,699,137,405      cpu-cycles:u                     #      5.4 GHz  cycles_frequency       ( +-  0.00% )  (66.67%)
    55,759,285,280      instructions:u                   #      1.3 instructions  insn_per_cycle  ( +-  0.00% )  (50.00%)
        14,425,647      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  3.35% )  (50.00%)

       # Table of individual measurements:
       7.730656862 (+0.066056496) #
       7.674391138 (+0.009790772) #
       7.649793175 (-0.014807191) #
       7.678472945 (+0.013872579) #
       7.666823339 (+0.002222973) #
       7.644981993 (-0.019618373) #
       7.646697542 (-0.017902824) #
       7.667259675 (+0.002659309) #
       7.645046443 (-0.019553923) #
       7.674405575 (+0.009805209) #
       7.645973097 (-0.018627269) #
       7.677626321 (+0.013025955) #
       7.661414137 (-0.003186229) #
       7.670943477 (+0.006343111) #
       7.669658413 (+0.005058047) #
       7.664787790 (+0.000187424) #
       7.666898579 (+0.002298213) #
       7.651175120 (-0.013425246) #
       7.665678526 (+0.001078160) #
       7.639323165 (-0.025277201) #

       # Final result:
       7.664600366 +- 0.004438231 seconds time elapsed  ( +-  0.06% )

```

## naive_dlog-defensive
```txt
# started on Wed Jun 17 09:13:24 2026


 Performance counter stats for './naive_dlog-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      4.9 faults/sec  page_faults_per_second  ( +-  0.23% )
         12,121.96 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.05% )
           493,697      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  2.53% )  (50.00%)
     5,722,541,497      branches:u                       #    472.1 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
    65,997,926,888      cpu-cycles:u                     #      5.4 GHz  cycles_frequency       ( +-  0.00% )  (66.67%)
    72,719,830,645      instructions:u                   #      1.1 instructions  insn_per_cycle  ( +-  0.00% )  (50.00%)
        20,726,995      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  4.32% )  (50.00%)

      # Table of individual measurements:
      12.149359784 (+0.025709589) #
      12.097025826 (-0.026624369) #
      12.098864456 (-0.024785739) #
      12.100385522 (-0.023264673) #
      12.100068419 (-0.023581776) #
      12.133749016 (+0.010098821) #
      12.144385958 (+0.020735763) #
      12.150833221 (+0.027183026) #
      12.143729209 (+0.020079014) #
      12.083766968 (-0.039883227) #
      12.140365886 (+0.016715691) #
      12.077799754 (-0.045850441) #
      12.146823158 (+0.023172963) #
      12.105714583 (-0.017935612) #
      12.099223618 (-0.024426577) #
      12.144381229 (+0.020731034) #
      12.134614575 (+0.010964380) #
      12.144267035 (+0.020616840) #
      12.145874122 (+0.022223927) #
      12.131771566 (+0.008121371) #

      # Final result:
      12.123650195 +- 0.005553128 seconds time elapsed  ( +-  0.05% )

```

## naive_dlog cpp
```txt
# started on Wed Jun 17 09:17:28 2026


 Performance counter stats for './cpp-naive_dlog' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
               131      page-faults:u                    #     10.5 faults/sec  page_faults_per_second  ( +-  0.16% )
         12,481.07 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.04% )
           656,281      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  2.08% )  (50.00%)
    12,599,267,285      branches:u                       #   1009.5 M/sec  branch_frequency     ( +-  0.00% )  (50.01%)
    67,979,064,988      cpu-cycles:u                     #      5.4 GHz  cycles_frequency       ( +-  0.00% )  (66.67%)
    88,270,970,256      instructions:u                   #      1.3 instructions  insn_per_cycle  ( +-  0.00% )  (50.00%)
        20,986,085      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  4.20% )  (49.99%)

      # Table of individual measurements:
      12.463166986 (-0.020902712) #
      12.518420688 (+0.034350990) #
      12.516250647 (+0.032180949) #
      12.506987156 (+0.022917458) #
      12.449068458 (-0.035001240) #
      12.476975302 (-0.007094396) #
      12.512868219 (+0.028798521) #
      12.478947322 (-0.005122376) #
      12.477679209 (-0.006390489) #
      12.462809788 (-0.021259910) #
      12.464450699 (-0.019618999) #
      12.468739293 (-0.015330405) #
      12.467436344 (-0.016633354) #
      12.503680579 (+0.019610881) #
      12.489385462 (+0.005315764) #
      12.470808063 (-0.013261635) #
      12.515384136 (+0.031314438) #
      12.503023409 (+0.018953711) #
      12.471997609 (-0.012072089) #
      12.463314592 (-0.020755106) #

      # Final result:
      12.484069698 +- 0.004921282 seconds time elapsed  ( +-  0.04% )

```

## naive_dlog-defensive cpp
```txt
# started on Wed Jun 17 09:21:38 2026


 Performance counter stats for './cpp-naive_dlog-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
               132      page-faults:u                    #     15.8 faults/sec  page_faults_per_second  ( +-  0.16% )
          8,337.63 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.04% )
           611,349      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  2.08% )  (49.98%)
     7,599,259,934      branches:u                       #    911.4 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
    45,387,886,445      cpu-cycles:u                     #      5.4 GHz  cycles_frequency       ( +-  0.00% )  (66.68%)
    47,960,524,252      instructions:u                   #      1.1 instructions  insn_per_cycle  ( +-  0.00% )  (50.02%)
        16,095,163      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  3.56% )  (50.00%)

       # Table of individual measurements:
       8.321749404 (-0.017180633) #
       8.323500431 (-0.015429606) #
       8.320486832 (-0.018443205) #
       8.320398868 (-0.018531169) #
       8.357630859 (+0.018700822) #
       8.323920897 (-0.015009140) #
       8.347823430 (+0.008893393) #
       8.324628761 (-0.014301276) #
       8.338135132 (-0.000794905) #
       8.309267320 (-0.029662717) #
       8.356301262 (+0.017371225) #
       8.357940108 (+0.019010071) #
       8.349675204 (+0.010745167) #
       8.346592717 (+0.007662680) #
       8.356741606 (+0.017811569) #
       8.336609839 (-0.002320198) #
       8.344119850 (+0.005189813) #
       8.342969478 (+0.004039441) #
       8.341948678 (+0.003018641) #
       8.358160059 (+0.019230022) #

       # Final result:
       8.338930037 +- 0.003455749 seconds time elapsed  ( +-  0.04% )

```

