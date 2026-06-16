# Benchmark Results: square_test

## square_test
```txt
# started on Tue Jun 16 13:42:49 2026


 Performance counter stats for './square_test' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      5.2 faults/sec  page_faults_per_second  ( +-  0.21% )
         11,532.49 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
         9,901,732      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  0.01% )  (49.99%)
    21,107,181,228      branches:u                       #   1830.2 M/sec  branch_frequency     ( +-  0.00% )  (49.99%)
    63,398,814,271      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.00% )  (66.66%)
   190,073,808,911      instructions:u                   #      3.0 instructions  insn_per_cycle  ( +-  0.00% )  (50.01%)
        82,632,431      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  2.31% )  (50.01%)

      # Table of individual measurements:
      11.529050790 (-0.005216242) #
      11.535912331 (+0.001645299) #
      11.531882259 (-0.002384773) #
      11.532830453 (-0.001436579) #
      11.536824268 (+0.002557236) #
      11.539013195 (+0.004746163) #
      11.529730702 (-0.004536330) #
      11.529991089 (-0.004275943) #
      11.532265807 (-0.002001225) #
      11.529137131 (-0.005129901) #
      11.536614255 (+0.002347223) #
      11.542566986 (+0.008299954) #
      11.536066600 (+0.001799568) #
      11.529788200 (-0.004478832) #
      11.531456202 (-0.002810830) #
      11.552082645 (+0.017815613) #
      11.532649906 (-0.001617126) #
      11.533516347 (-0.000750685) #
      11.533768239 (-0.000498793) #
      11.530193237 (-0.004073795) #

      # Final result:
      11.534267032 +- 0.001234304 seconds time elapsed  ( +-  0.01% )

```

## square_test-defensive
```txt
# started on Tue Jun 16 13:46:40 2026


 Performance counter stats for './square_test-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      5.2 faults/sec  page_faults_per_second  ( +-  0.22% )
         11,532.73 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
         9,900,210      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  0.01% )  (49.99%)
    21,107,563,600      branches:u                       #   1830.2 M/sec  branch_frequency     ( +-  0.00% )  (49.99%)
    63,395,327,301      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.00% )  (66.66%)
   190,073,121,798      instructions:u                   #      3.0 instructions  insn_per_cycle  ( +-  0.00% )  (50.01%)
        92,024,649      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  0.50% )  (50.01%)

      # Table of individual measurements:
      11.542213024 (+0.007617628) #
      11.532450612 (-0.002144784) #
      11.533232646 (-0.001362750) #
      11.534017956 (-0.000577440) #
      11.533129914 (-0.001465482) #
      11.533837488 (-0.000757908) #
      11.533415999 (-0.001179397) #
      11.534327695 (-0.000267701) #
      11.534857787 (+0.000262391) #
      11.535360228 (+0.000764832) #
      11.529726003 (-0.004869393) #
      11.538697224 (+0.004101828) #
      11.539249097 (+0.004653701) #
      11.534609412 (+0.000014016) #
      11.532193542 (-0.002401854) #
      11.532447206 (-0.002148190) #
      11.538722480 (+0.004127084) #
      11.534665208 (+0.000069812) #
      11.533520355 (-0.001075041) #
      11.531234035 (-0.003361361) #

      # Final result:
      11.534595396 +- 0.000672243 seconds time elapsed  ( +-  0.01% )

```

## square_test cpp
```txt
# started on Tue Jun 16 13:50:31 2026


 Performance counter stats for './cpp-square_test' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
               132      page-faults:u                    #     33.7 faults/sec  page_faults_per_second  ( +-  0.14% )
          3,914.62 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.02% )
         9,930,331      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  0.16% )  (50.00%)
    21,094,647,083      branches:u                       #   5388.7 M/sec  branch_frequency     ( +-  0.00% )  (50.01%)
    21,512,869,720      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.01% )  (66.67%)
    84,437,710,067      instructions:u                   #      3.9 instructions  insn_per_cycle  ( +-  0.00% )  (50.00%)
        85,244,749      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  2.71% )  (49.99%)

       # Table of individual measurements:
       3.918599117 (+0.002956189) #
       3.912771249 (-0.002871679) #
       3.919938995 (+0.004296067) #
       3.917901591 (+0.002258663) #
       3.917834045 (+0.002191117) #
       3.914682427 (-0.000960501) #
       3.917311486 (+0.001668558) #
       3.917661392 (+0.002018464) #
       3.912149315 (-0.003493613) #
       3.911876716 (-0.003766212) #
       3.913636208 (-0.002006720) #
       3.912705887 (-0.002937041) #
       3.918741092 (+0.003098164) #
       3.919562449 (+0.003919521) #
       3.918787379 (+0.003144451) #
       3.914023413 (-0.001619515) #
       3.911532160 (-0.004110768) #
       3.910715873 (-0.004927055) #
       3.919674619 (+0.004031691) #
       3.912753156 (-0.002889772) #

       # Final result:
       3.915642928 +- 0.000717120 seconds time elapsed  ( +-  0.02% )

```

## square_test-defensive cpp
```txt
# started on Tue Jun 16 13:51:49 2026


 Performance counter stats for './cpp-square_test-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
               132      page-faults:u                    #     33.7 faults/sec  page_faults_per_second  ( +-  0.18% )
          3,922.42 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.11% )
         9,979,763      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  0.26% )  (49.98%)
    21,095,635,530      branches:u                       #   5378.2 M/sec  branch_frequency     ( +-  0.01% )  (50.01%)
    21,527,300,275      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.06% )  (66.69%)
    84,406,490,949      instructions:u                   #      3.9 instructions  insn_per_cycle  ( +-  0.03% )  (50.02%)
        95,393,474      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +- 11.15% )  (49.99%)

       # Table of individual measurements:
       3.916956132 (-0.006384591) #
       3.915434464 (-0.007906259) #
       3.918333088 (-0.005007635) #
       3.917507023 (-0.005833700) #
       3.915652041 (-0.007688682) #
       3.914265426 (-0.009075297) #
       3.914954205 (-0.008386518) #
       3.915683360 (-0.007657363) #
       3.918960753 (-0.004379970) #
       3.914227074 (-0.009113649) #
       3.916960290 (-0.006380433) #
       3.914405979 (-0.008934744) #
       3.913373256 (-0.009967467) #
       3.913420274 (-0.009920449) #
       3.918515901 (-0.004824822) #
       3.995720294 (+0.072379571) #
       3.948291799 (+0.024951076) #
       3.929567575 (+0.006226852) #
       3.932662317 (+0.009321594) #
       3.921923218 (-0.001417505) #

       # Final result:
       3.923340723 +- 0.004250600 seconds time elapsed  ( +-  0.11% )

```

