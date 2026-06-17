# Benchmark Results: fibonacci

## fibonacci
```txt
# started on Tue Jun 16 21:51:33 2026


 Performance counter stats for './fibonacci' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #     13.7 faults/sec  page_faults_per_second  ( +-  0.22% )
          4,365.30 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
         9,367,724      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  0.00% )  (50.00%)
    19,230,658,825      branches:u                       #   4405.3 M/sec  branch_frequency     ( +-  0.00% )  (50.01%)
    23,839,696,724      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.00% )  (66.68%)
    97,305,656,299      instructions:u                   #      4.1 instructions  insn_per_cycle  ( +-  0.00% )  (50.00%)
     4,393,379,594      stalled-cycles-frontend:u        #     0.18 frontend_cycles_idle        ( +-  0.05% )  (49.99%)

       # Table of individual measurements:
       4.364674496 (-0.001275676) #
       4.367802219 (+0.001852047) #
       4.367804293 (+0.001854121) #
       4.366852331 (+0.000902159) #
       4.363011342 (-0.002938830) #
       4.366273508 (+0.000323336) #
       4.367844388 (+0.001894216) #
       4.363739214 (-0.002210958) #
       4.365030842 (-0.000919330) #
       4.361864746 (-0.004085426) #
       4.365630094 (-0.000320078) #
       4.364515848 (-0.001434324) #
       4.364455836 (-0.001494336) #
       4.369402614 (+0.003452442) #
       4.370041570 (+0.004091398) #
       4.366683145 (+0.000732973) #
       4.371047082 (+0.005096910) #
       4.365123816 (-0.000826356) #
       4.364103686 (-0.001846486) #
       4.363102363 (-0.002847809) #

       # Final result:
       4.365950172 +- 0.000552107 seconds time elapsed  ( +-  0.01% )

```

## fibonacci-defensive
```txt
# started on Tue Jun 16 21:53:00 2026


 Performance counter stats for './fibonacci-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #     11.6 faults/sec  page_faults_per_second  ( +-  0.19% )
          5,156.75 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.20% )
        15,089,321      branch-misses:u                  #      0.1 %  branch_miss_rate         ( +-  0.00% )  (49.98%)
    28,845,150,756      branches:u                       #   5593.7 M/sec  branch_frequency     ( +-  0.00% )  (50.02%)
    28,096,760,234      cpu-cycles:u                     #      5.4 GHz  cycles_frequency       ( +-  0.19% )  (66.69%)
   132,784,950,686      instructions:u                   #      4.7 instructions  insn_per_cycle  ( +-  0.00% )  (50.02%)
       608,749,524      stalled-cycles-frontend:u        #     0.02 frontend_cycles_idle        ( +-  2.02% )  (49.98%)

       # Table of individual measurements:
       5.140540367 (-0.016885392) #
       5.160003734 (+0.002577975) #
       5.162482343 (+0.005056584) #
       5.140515460 (-0.016910299) #
       5.140157521 (-0.017268238) #
       5.139668255 (-0.017757504) #
       5.160987294 (+0.003561535) #
       5.162973582 (+0.005547823) #
       5.141057075 (-0.016368684) #
       5.143791041 (-0.013634718) #
       5.140260995 (-0.017164764) #
       5.139498528 (-0.017927231) #
       5.139648408 (-0.017777351) #
       5.141049370 (-0.016376389) #
       5.140946528 (-0.016479231) #
       5.348873245 (+0.191447486) #
       5.162269735 (+0.004843976) #
       5.163642835 (+0.006217076) #
       5.140351765 (-0.017073994) #
       5.139797096 (-0.017628663) #

       # Final result:
       5.157425759 +- 0.010324022 seconds time elapsed  ( +-  0.20% )

```

## fibonacci cpp
```txt
# started on Tue Jun 16 21:54:44 2026


 Performance counter stats for './cpp-fibonacci' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
               132      page-faults:u                    #     30.2 faults/sec  page_faults_per_second  ( +-  0.19% )
          4,364.79 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.02% )
         9,377,427      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  0.02% )  (49.99%)
    19,228,866,821      branches:u                       #   4405.5 M/sec  branch_frequency     ( +-  0.00% )  (50.01%)
    23,838,239,883      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.00% )  (66.68%)
    97,300,704,503      instructions:u                   #      4.1 instructions  insn_per_cycle  ( +-  0.00% )  (50.01%)
     4,479,000,033      stalled-cycles-frontend:u        #     0.19 frontend_cycles_idle        ( +-  0.03% )  (49.99%)

       # Table of individual measurements:
       4.368134220 (+0.002494583) #
       4.364029478 (-0.001610159) #
       4.366226931 (+0.000587294) #
       4.360577618 (-0.005062019) #
       4.364659366 (-0.000980271) #
       4.360728009 (-0.004911628) #
       4.363149792 (-0.002489845) #
       4.363666519 (-0.001973118) #
       4.363730028 (-0.001909609) #
       4.369843630 (+0.004203993) #
       4.363555200 (-0.002084437) #
       4.365955152 (+0.000315515) #
       4.370046128 (+0.004406491) #
       4.371758082 (+0.006118445) #
       4.366283717 (+0.000644080) #
       4.362234228 (-0.003405409) #
       4.358698761 (-0.006940876) #
       4.369663753 (+0.004024116) #
       4.370203743 (+0.004564106) #
       4.369648394 (+0.004008757) #

       # Final result:
       4.365639637 +- 0.000836442 seconds time elapsed  ( +-  0.02% )

```

## fibonacci-defensive cpp
```txt
# started on Tue Jun 16 21:56:12 2026


 Performance counter stats for './cpp-fibonacci-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
               132      page-faults:u                    #     25.2 faults/sec  page_faults_per_second  ( +-  0.15% )
          5,233.62 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.02% )
         9,409,464      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  0.03% )  (49.98%)
    24,037,206,749      branches:u                       #   4592.8 M/sec  branch_frequency     ( +-  0.00% )  (49.99%)
    28,655,799,292      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.00% )  (66.66%)
   106,915,719,118      instructions:u                   #      3.7 instructions  insn_per_cycle  ( +-  0.00% )  (50.02%)
     2,524,770,889      stalled-cycles-frontend:u        #     0.09 frontend_cycles_idle        ( +-  0.08% )  (50.01%)

       # Table of individual measurements:
       5.239241272 (+0.004803487) #
       5.242804030 (+0.008366245) #
       5.239638916 (+0.005201131) #
       5.248435579 (+0.013997794) #
       5.231894994 (-0.002542791) #
       5.230711307 (-0.003726478) #
       5.229085615 (-0.005352170) #
       5.230759368 (-0.003678417) #
       5.241520218 (+0.007082433) #
       5.231069669 (-0.003368116) #
       5.240256282 (+0.005818497) #
       5.230207695 (-0.004230090) #
       5.229238832 (-0.005198953) #
       5.230140510 (-0.004297275) #
       5.230227642 (-0.004210143) #
       5.231841112 (-0.002596673) #
       5.230945125 (-0.003492660) #
       5.239871591 (+0.005433806) #
       5.230241359 (-0.004196426) #
       5.230624576 (-0.003813209) #

       # Final result:
       5.234437785 +- 0.001293383 seconds time elapsed  ( +-  0.02% )

```

