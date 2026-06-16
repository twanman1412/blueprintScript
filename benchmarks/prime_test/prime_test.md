# Benchmark Results: prime_test

## prime_test
```txt
# started on Tue Jun 16 13:17:30 2026


 Performance counter stats for './prime_test' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      3.2 faults/sec  page_faults_per_second  ( +-  0.19% )
         19,030.36 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.00% )
        21,753,463      branch-misses:u                  #      0.1 %  branch_miss_rate         ( +-  0.06% )  (49.99%)
    26,021,614,086      branches:u                       #   1367.4 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
   104,647,690,730      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.00% )  (66.66%)
   182,015,739,657      instructions:u                   #      1.7 instructions  insn_per_cycle  ( +-  0.00% )  (50.01%)
       148,266,351      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  0.09% )  (50.00%)

      # Table of individual measurements:
      19.030261921 (-0.001825993) #
      19.032400654 (+0.000312740) #
      19.033098210 (+0.001010296) #
      19.031821640 (-0.000266274) #
      19.033935357 (+0.001847443) #
      19.029632574 (-0.002455340) #
      19.031018288 (-0.001069626) #
      19.032571865 (+0.000483951) #
      19.031361831 (-0.000726083) #
      19.036731891 (+0.004643977) #
      19.034614248 (+0.002526334) #
      19.032626758 (+0.000538844) #
      19.035592418 (+0.003504504) #
      19.031624111 (-0.000463803) #
      19.034656326 (+0.002568412) #
      19.029217838 (-0.002870076) #
      19.032035321 (-0.000052593) #
      19.027615920 (-0.004471994) #
      19.028774498 (-0.003313416) #
      19.032166616 (+0.000078702) #

      # Final result:
      19.032087914 +- 0.000519178 seconds time elapsed  ( +-  0.00% )

```

## prime_test-defensive
```txt
# started on Tue Jun 16 13:23:51 2026


 Performance counter stats for './prime_test-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      3.2 faults/sec  page_faults_per_second  ( +-  0.23% )
         19,035.62 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
        21,746,389      branch-misses:u                  #      0.1 %  branch_miss_rate         ( +-  0.05% )  (50.00%)
    26,022,079,087      branches:u                       #   1367.0 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
   104,650,572,336      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.00% )  (66.66%)
   182,012,809,434      instructions:u                   #      1.7 instructions  insn_per_cycle  ( +-  0.00% )  (50.00%)
       148,493,415      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  0.13% )  (50.00%)

      # Table of individual measurements:
      19.032010915 (-0.005705299) #
      19.031004952 (-0.006711262) #
      19.036968754 (-0.000747460) #
      19.034353590 (-0.003362624) #
      19.083182757 (+0.045466543) #
      19.038331795 (+0.000615581) #
      19.040302132 (+0.002585918) #
      19.039833406 (+0.002117192) #
      19.034043129 (-0.003673085) #
      19.041634857 (+0.003918643) #
      19.035774699 (-0.001941515) #
      19.034688216 (-0.003027998) #
      19.042619349 (+0.004903135) #
      19.036721692 (-0.000994522) #
      19.033714193 (-0.004002021) #
      19.030256932 (-0.007459282) #
      19.031585569 (-0.006130645) #
      19.029436657 (-0.008279557) #
      19.035333544 (-0.002382670) #
      19.032527141 (-0.005189073) #

      # Final result:
      19.037716214 +- 0.002536795 seconds time elapsed  ( +-  0.01% )

```

## prime_test cpp
```txt
# started on Tue Jun 16 13:30:12 2026


 Performance counter stats for './cpp-prime_test' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
               131      page-faults:u                    #      6.9 faults/sec  page_faults_per_second  ( +-  0.15% )
         18,908.59 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
        26,018,232      branch-misses:u                  #      0.2 %  branch_miss_rate         ( +-  1.26% )  (50.00%)
    17,326,077,356      branches:u                       #    916.3 M/sec  branch_frequency     ( +-  0.00% )  (50.01%)
   103,961,881,952      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.01% )  (66.67%)
    94,972,388,154      instructions:u                   #      0.9 instructions  insn_per_cycle  ( +-  0.00% )  (50.00%)
       209,552,056      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  1.18% )  (49.99%)

      # Table of individual measurements:
      18.913750524 (+0.002962131) #
      18.901727812 (-0.009060581) #
      18.901388618 (-0.009399776) #
      18.906153635 (-0.004634758) #
      18.904631336 (-0.006157057) #
      18.906929257 (-0.003859136) #
      18.921581159 (+0.010792765) #
      18.919254123 (+0.008465730) #
      18.905712129 (-0.005076264) #
      18.911328811 (+0.000540418) #
      18.912894902 (+0.002106509) #
      18.912383735 (+0.001595341) #
      18.904439477 (-0.006348916) #
      18.926098403 (+0.015310010) #
      18.906337449 (-0.004450945) #
      18.920346929 (+0.009558536) #
      18.918852372 (+0.008063979) #
      18.912143045 (+0.001354652) #
      18.911422386 (+0.000633993) #
      18.898391768 (-0.012396625) #

      # Final result:
      18.910788393 +- 0.001687045 seconds time elapsed  ( +-  0.01% )

```

## prime_test-defensive cpp
```txt
# started on Tue Jun 16 13:36:31 2026


 Performance counter stats for './cpp-prime_test-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
               132      page-faults:u                    #      7.0 faults/sec  page_faults_per_second  ( +-  0.15% )
         18,905.16 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
        22,620,374      branch-misses:u                  #      0.1 %  branch_miss_rate         ( +-  0.23% )  (50.00%)
    17,350,700,375      branches:u                       #    917.8 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
   103,933,837,909      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.00% )  (66.67%)
    95,046,277,465      instructions:u                   #      0.9 instructions  insn_per_cycle  ( +-  0.00% )  (50.00%)
       196,083,285      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  0.28% )  (50.00%)

      # Table of individual measurements:
      18.907242392 (-0.000330203) #
      18.900492680 (-0.007079915) #
      18.897677983 (-0.009894612) #
      18.905463343 (-0.002109252) #
      18.903465214 (-0.004107381) #
      18.909505468 (+0.001932873) #
      18.907557262 (-0.000015333) #
      18.911808238 (+0.004235643) #
      18.902848980 (-0.004723615) #
      18.906315097 (-0.001257498) #
      18.902538379 (-0.005034216) #
      18.906812879 (-0.000759716) #
      18.911743367 (+0.004170772) #
      18.910269468 (+0.002696873) #
      18.904210398 (-0.003362197) #
      18.917388832 (+0.009816237) #
      18.916195530 (+0.008622935) #
      18.910983084 (+0.003410489) #
      18.906340876 (-0.001231719) #
      18.912592436 (+0.005019841) #

      # Final result:
      18.907572595 +- 0.001130885 seconds time elapsed  ( +-  0.01% )

```

