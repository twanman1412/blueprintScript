# Benchmark Results: bbs_bits

## bbs_bits
```txt
# started on Tue Jun 16 21:38:49 2026


 Performance counter stats for './bbs_bits' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      6.7 faults/sec  page_faults_per_second  ( +-  0.18% )
          8,937.06 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.09% )
     2,088,138,001      branch-misses:u                  #     20.8 %  branch_miss_rate         ( +-  0.00% )  (49.98%)
    10,057,946,090      branches:u                       #   1125.4 M/sec  branch_frequency     ( +-  0.00% )  (49.99%)
    49,098,135,965      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.01% )  (66.67%)
    63,156,983,979      instructions:u                   #      1.3 instructions  insn_per_cycle  ( +-  0.00% )  (50.02%)
    14,642,985,592      stalled-cycles-frontend:u        #     0.30 frontend_cycles_idle        ( +-  0.03% )  (50.01%)

       # Table of individual measurements:
       9.078223741 (+0.139870049) #
       8.993506487 (+0.055152795) #
       8.965614947 (+0.027261255) #
       8.931922399 (-0.006431293) #
       8.927949714 (-0.010403978) #
       8.927164434 (-0.011189258) #
       8.921921502 (-0.016432190) #
       8.923805568 (-0.014548124) #
       8.921771240 (-0.016582452) #
       8.926055469 (-0.012298223) #
       8.925111542 (-0.013242150) #
       8.922868804 (-0.015484888) #
       8.922171450 (-0.016182242) #
       8.923674814 (-0.014678878) #
       8.923330429 (-0.015023263) #
       8.921269111 (-0.017084581) #
       8.926214016 (-0.012139676) #
       8.921914859 (-0.016438833) #
       8.937118905 (-0.001234787) #
       8.925464403 (-0.012889289) #

       # Final result:
       8.938353692 +- 0.008355056 seconds time elapsed  ( +-  0.09% )

```

## bbs_bits-defensive
```txt
# started on Tue Jun 16 21:41:48 2026


 Performance counter stats for './bbs_bits-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      6.7 faults/sec  page_faults_per_second  ( +-  0.18% )
          8,926.13 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
     2,088,143,180      branch-misses:u                  #     20.8 %  branch_miss_rate         ( +-  0.00% )  (49.99%)
    10,058,059,964      branches:u                       #   1126.8 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
    49,102,209,719      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.01% )  (66.67%)
    63,158,475,434      instructions:u                   #      1.3 instructions  insn_per_cycle  ( +-  0.00% )  (50.01%)
    14,634,259,010      stalled-cycles-frontend:u        #     0.30 frontend_cycles_idle        ( +-  0.03% )  (50.00%)

       # Table of individual measurements:
       8.932142301 (+0.004925606) #
       8.926961735 (-0.000254960) #
       8.931178908 (+0.003962213) #
       8.929910183 (+0.002693488) #
       8.926182646 (-0.001034049) #
       8.927368226 (+0.000151531) #
       8.923714538 (-0.003502157) #
       8.930716132 (+0.003499437) #
       8.929540101 (+0.002323406) #
       8.926220728 (-0.000995967) #
       8.923070121 (-0.004146574) #
       8.926066209 (-0.001150486) #
       8.929479016 (+0.002262321) #
       8.930816369 (+0.003599674) #
       8.926777570 (-0.000439125) #
       8.924539441 (-0.002677254) #
       8.927727087 (+0.000510392) #
       8.921515402 (-0.005701293) #
       8.924919292 (-0.002297403) #
       8.925487896 (-0.001728799) #

       # Final result:
       8.927216695 +- 0.000657468 seconds time elapsed  ( +-  0.01% )

```

## bbs_bits cpp
```txt
# started on Tue Jun 16 21:44:47 2026


 Performance counter stats for './cpp-bbs_bits' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
               132      page-faults:u                    #     13.0 faults/sec  page_faults_per_second  ( +-  0.15% )
         10,123.38 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.00% )
     2,135,730,605      branch-misses:u                  #     21.0 %  branch_miss_rate         ( +-  0.02% )  (50.00%)
    10,158,513,516      branches:u                       #   1003.5 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
    55,700,943,145      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.00% )  (66.67%)
    82,811,267,247      instructions:u                   #      1.5 instructions  insn_per_cycle  ( +-  0.00% )  (50.00%)
    13,795,132,813      stalled-cycles-frontend:u        #     0.25 frontend_cycles_idle        ( +-  0.02% )  (50.00%)

      # Table of individual measurements:
      10.127383591 (+0.002991075) #
      10.126412302 (+0.002019786) #
      10.124319235 (-0.000073281) #
      10.124817969 (+0.000425453) #
      10.121536628 (-0.002855888) #
      10.124284981 (-0.000107535) #
      10.125214611 (+0.000822095) #
      10.123315597 (-0.001076919) #
      10.124887389 (+0.000494873) #
      10.125853376 (+0.001460860) #
      10.122909026 (-0.001483490) #
      10.125891518 (+0.001499002) #
      10.124881027 (+0.000488511) #
      10.124301322 (-0.000091194) #
      10.122938972 (-0.001453544) #
      10.121598002 (-0.002794514) #
      10.125124973 (+0.000732457) #
      10.120675956 (-0.003716560) #
      10.128163220 (+0.003770704) #
      10.123340624 (-0.001051892) #

      # Final result:
      10.124392516 +- 0.000428846 seconds time elapsed  ( +-  0.00% )

```

## bbs_bits-defensive cpp
```txt
# started on Tue Jun 16 21:48:11 2026


 Performance counter stats for './cpp-bbs_bits-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
               132      page-faults:u                    #     13.1 faults/sec  page_faults_per_second  ( +-  0.15% )
         10,108.23 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
     2,134,023,923      branch-misses:u                  #     21.0 %  branch_miss_rate         ( +-  0.01% )  (50.00%)
    10,158,459,006      branches:u                       #   1005.0 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
    55,614,262,071      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.01% )  (66.67%)
    83,011,489,430      instructions:u                   #      1.5 instructions  insn_per_cycle  ( +-  0.00% )  (50.00%)
    13,838,921,611      stalled-cycles-frontend:u        #     0.25 frontend_cycles_idle        ( +-  0.06% )  (50.00%)

      # Table of individual measurements:
      10.117712219 (+0.008365546) #
      10.112778597 (+0.003431924) #
      10.107844312 (-0.001502361) #
      10.114972122 (+0.005625449) #
      10.108894056 (-0.000452617) #
      10.105119071 (-0.004227602) #
      10.106319478 (-0.003027195) #
      10.113821107 (+0.004474434) #
      10.112607557 (+0.003260884) #
      10.103051111 (-0.006295562) #
      10.119180127 (+0.009833454) #
      10.106500978 (-0.002845695) #
      10.105626440 (-0.003720233) #
      10.110927643 (+0.001580970) #
      10.112160389 (+0.002813716) #
      10.107497943 (-0.001848730) #
      10.109181194 (-0.000165479) #
      10.102443834 (-0.006902839) #
      10.111629535 (+0.002282862) #
      10.098665753 (-0.010680920) #

      # Final result:
      10.109346673 +- 0.001161478 seconds time elapsed  ( +-  0.01% )

```

