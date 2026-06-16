# Benchmark Results: bbs_bits

## bbs_bits
```txt
# started on Tue Jun 16 12:15:03 2026


 Performance counter stats for './bbs_bits' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      4.7 faults/sec  page_faults_per_second  ( +-  0.26% )
         12,635.25 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.06% )
     2,084,325,209      branch-misses:u                  #     26.1 %  branch_miss_rate         ( +-  0.00% )  (50.00%)
     7,980,764,108      branches:u                       #    631.6 M/sec  branch_frequency     ( +-  0.00% )  (49.99%)
    69,311,298,364      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.00% )  (66.66%)
   118,199,327,492      instructions:u                   #      1.7 instructions  insn_per_cycle  ( +-  0.00% )  (50.00%)
    13,496,663,439      stalled-cycles-frontend:u        #     0.19 frontend_cycles_idle        ( +-  0.00% )  (50.01%)

      # Table of individual measurements:
      12.755142558 (+0.118493235) #
      12.654966241 (+0.018316918) #
      12.660863489 (+0.024214166) #
      12.654594777 (+0.017945454) #
      12.656564332 (+0.019915009) #
      12.654353575 (+0.017704252) #
      12.654226247 (+0.017576924) #
      12.645780380 (+0.009131057) #
      12.627405480 (-0.009243843) #
      12.637263229 (+0.000613906) #
      12.622540485 (-0.014108838) #
      12.613553135 (-0.023096188) #
      12.611689927 (-0.024959396) #
      12.609700865 (-0.026948458) #
      12.610643820 (-0.026005503) #
      12.613057137 (-0.023592186) #
      12.611797219 (-0.024852104) #
      12.616400463 (-0.020248860) #
      12.610850776 (-0.025798547) #
      12.611592334 (-0.025056989) #

      # Final result:
      12.636649323 +- 0.007627572 seconds time elapsed  ( +-  0.06% )

```

## bbs_bits-defensive
```txt
# started on Tue Jun 16 12:19:16 2026


 Performance counter stats for './bbs_bits-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      4.7 faults/sec  page_faults_per_second  ( +-  0.23% )
         12,687.90 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.03% )
     2,084,573,805      branch-misses:u                  #     26.1 %  branch_miss_rate         ( +-  0.08% )  (49.99%)
     7,980,965,381      branches:u                       #    629.0 M/sec  branch_frequency     ( +-  0.00% )  (49.99%)
    69,731,271,409      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.02% )  (66.66%)
   118,794,200,019      instructions:u                   #      1.7 instructions  insn_per_cycle  ( +-  0.00% )  (50.01%)
    12,612,641,202      stalled-cycles-frontend:u        #     0.18 frontend_cycles_idle        ( +-  0.06% )  (50.01%)

      # Table of individual measurements:
      12.684560028 (-0.004798175) #
      12.686194187 (-0.003164016) #
      12.685261541 (-0.004096662) #
      12.684595746 (-0.004762457) #
      12.689473454 (+0.000115251) #
      12.685392536 (-0.003965667) #
      12.682093071 (-0.007265132) #
      12.685117692 (-0.004240511) #
      12.689194201 (-0.000164002) #
      12.750876694 (+0.061518491) #
      12.683254846 (-0.006103357) #
      12.685748352 (-0.003609851) #
      12.683584062 (-0.005774141) #
      12.701536491 (+0.012178288) #
      12.685612167 (-0.003746036) #
      12.680878788 (-0.008479415) #
      12.685405701 (-0.003952502) #
      12.685722183 (-0.003636020) #
      12.684115547 (-0.005242656) #
      12.688546780 (-0.000811423) #

      # Final result:
      12.689358203 +- 0.003371087 seconds time elapsed  ( +-  0.03% )

```

## bbs_bits cpp
```txt
# started on Tue Jun 16 12:23:30 2026


 Performance counter stats for './cpp-bbs_bits' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
               132      page-faults:u                    #     13.3 faults/sec  page_faults_per_second  ( +-  0.13% )
          9,907.85 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
     2,093,908,228      branch-misses:u                  #     25.7 %  branch_miss_rate         ( +-  0.01% )  (49.99%)
     8,145,314,875      branches:u                       #    822.1 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
    54,450,411,918      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.00% )  (66.68%)
    86,394,418,092      instructions:u                   #      1.6 instructions  insn_per_cycle  ( +-  0.00% )  (50.01%)
    12,891,660,382      stalled-cycles-frontend:u        #     0.24 frontend_cycles_idle        ( +-  0.01% )  (50.00%)

       # Table of individual measurements:
       9.905137072 (-0.004193966) #
       9.909565690 (+0.000234652) #
       9.905825099 (-0.003505939) #
       9.907744672 (-0.001586366) #
       9.907100327 (-0.002230711) #
       9.908362879 (-0.000968159) #
       9.908768598 (-0.000562440) #
       9.908311203 (-0.001019835) #
       9.906381602 (-0.002949436) #
       9.911765367 (+0.002434329) #
       9.913268150 (+0.003937112) #
       9.908387505 (-0.000943533) #
       9.918091567 (+0.008760529) #
       9.913689809 (+0.004358771) #
       9.913012011 (+0.003680973) #
       9.910098488 (+0.000767450) #
       9.906560045 (-0.002770993) #
       9.908167113 (-0.001163925) #
       9.906918606 (-0.002412432) #
       9.909464962 (+0.000133924) #

       # Final result:
       9.909331038 +- 0.000717257 seconds time elapsed  ( +-  0.01% )

```

## bbs_bits-defensive cpp
```txt
# started on Tue Jun 16 12:26:49 2026


 Performance counter stats for './cpp-bbs_bits-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
               132      page-faults:u                    #     13.3 faults/sec  page_faults_per_second  ( +-  0.16% )
          9,904.16 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
     2,092,246,285      branch-misses:u                  #     25.1 %  branch_miss_rate         ( +-  0.00% )  (50.00%)
     8,345,300,679      branches:u                       #    842.6 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
    54,426,266,016      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.00% )  (66.66%)
    86,592,145,372      instructions:u                   #      1.6 instructions  insn_per_cycle  ( +-  0.00% )  (50.00%)
    13,092,870,700      stalled-cycles-frontend:u        #     0.24 frontend_cycles_idle        ( +-  0.01% )  (50.00%)

       # Table of individual measurements:
       9.902145924 (-0.003643001) #
       9.906049169 (+0.000260244) #
       9.903073780 (-0.002715145) #
       9.905183970 (-0.000604955) #
       9.903084130 (-0.002704795) #
       9.908025097 (+0.002236172) #
       9.906861079 (+0.001072154) #
       9.905214937 (-0.000573988) #
       9.906180525 (+0.000391600) #
       9.905494060 (-0.000294865) #
       9.908428652 (+0.002639727) #
       9.904938710 (-0.000850215) #
       9.907450612 (+0.001661687) #
       9.902141646 (-0.003647279) #
       9.908618076 (+0.002829151) #
       9.902642844 (-0.003146081) #
       9.908135303 (+0.002346378) #
       9.910577865 (+0.004788940) #
       9.900504822 (-0.005284103) #
       9.911027306 (+0.005238381) #

       # Final result:
       9.905788925 +- 0.000650043 seconds time elapsed  ( +-  0.01% )

```

