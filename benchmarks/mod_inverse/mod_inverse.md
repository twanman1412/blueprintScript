# Benchmark Results: mod_inverse

## mod_inverse
```txt
# started on Tue Jun 16 12:51:57 2026


 Performance counter stats for './mod_inverse' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      7.3 faults/sec  page_faults_per_second  ( +-  0.21% )
          8,200.57 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
     1,389,323,898      branch-misses:u                  #     26.0 %  branch_miss_rate         ( +-  0.01% )  (49.98%)
     5,346,675,228      branches:u                       #    652.0 M/sec  branch_frequency     ( +-  0.00% )  (49.99%)
    44,936,900,856      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.00% )  (66.67%)
    82,490,730,007      instructions:u                   #      1.8 instructions  insn_per_cycle  ( +-  0.00% )  (50.02%)
     9,180,698,777      stalled-cycles-frontend:u        #     0.20 frontend_cycles_idle        ( +-  0.13% )  (50.01%)

       # Table of individual measurements:
       8.196666421 (-0.005152024) #
       8.196500250 (-0.005318195) #
       8.198127585 (-0.003690860) #
       8.192135681 (-0.009682764) #
       8.193806087 (-0.008012358) #
       8.199759199 (-0.002059245) #
       8.205285512 (+0.003467067) #
       8.203148732 (+0.001330288) #
       8.197411706 (-0.004406739) #
       8.192440462 (-0.009377983) #
       8.210802697 (+0.008984252) #
       8.207448159 (+0.005629714) #
       8.207958134 (+0.006139689) #
       8.204154375 (+0.002335930) #
       8.203443274 (+0.001624829) #
       8.205247300 (+0.003428855) #
       8.203716155 (+0.001897710) #
       8.206571529 (+0.004753084) #
       8.206308506 (+0.004490061) #
       8.205437126 (+0.003618681) #

       # Final result:
       8.201818445 +- 0.001236727 seconds time elapsed  ( +-  0.02% )

```

## mod_inverse-defensive
```txt
# started on Tue Jun 16 12:54:41 2026


 Performance counter stats for './mod_inverse-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      7.3 faults/sec  page_faults_per_second  ( +-  0.24% )
          8,200.96 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
     1,391,532,031      branch-misses:u                  #     26.0 %  branch_miss_rate         ( +-  0.02% )  (49.99%)
     5,346,787,623      branches:u                       #    652.0 M/sec  branch_frequency     ( +-  0.00% )  (49.99%)
    44,928,021,560      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.01% )  (66.65%)
    86,402,973,080      instructions:u                   #      1.9 instructions  insn_per_cycle  ( +-  0.00% )  (50.01%)
     8,361,698,710      stalled-cycles-frontend:u        #     0.19 frontend_cycles_idle        ( +-  0.04% )  (50.01%)

       # Table of individual measurements:
       8.204005687 (+0.001921765) #
       8.204035512 (+0.001951590) #
       8.204092480 (+0.002008558) #
       8.200419906 (-0.001664016) #
       8.199729053 (-0.002354869) #
       8.202973595 (+0.000889673) #
       8.196983564 (-0.005100358) #
       8.200439032 (-0.001644890) #
       8.195086594 (-0.006997328) #
       8.194332523 (-0.007751399) #
       8.191524517 (-0.010559405) #
       8.197710424 (-0.004373498) #
       8.207814976 (+0.005731054) #
       8.212284461 (+0.010200539) #
       8.203943861 (+0.001859939) #
       8.205823018 (+0.003739096) #
       8.203703671 (+0.001619749) #
       8.210186605 (+0.008102683) #
       8.204046332 (+0.001962410) #
       8.202542628 (+0.000458706) #

       # Final result:
       8.202083922 +- 0.001164961 seconds time elapsed  ( +-  0.01% )

```

## mod_inverse cpp
```txt
# started on Tue Jun 16 12:57:26 2026


 Performance counter stats for './cpp-mod_inverse' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
               132      page-faults:u                    #     20.8 faults/sec  page_faults_per_second  ( +-  0.16% )
          6,343.10 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
     1,403,674,026      branch-misses:u                  #     25.1 %  branch_miss_rate         ( +-  0.01% )  (49.99%)
     5,602,720,549      branches:u                       #    883.3 M/sec  branch_frequency     ( +-  0.00% )  (50.02%)
    34,854,626,703      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.00% )  (66.68%)
    27,462,084,132      instructions:u                   #      0.8 instructions  insn_per_cycle  ( +-  0.00% )  (50.01%)
    12,107,496,905      stalled-cycles-frontend:u        #     0.35 frontend_cycles_idle        ( +-  0.04% )  (49.98%)

       # Table of individual measurements:
       6.343223565 (-0.001063037) #
       6.343428328 (-0.000858274) #
       6.344657870 (+0.000371268) #
       6.345077746 (+0.000791144) #
       6.342204027 (-0.002082575) #
       6.342705937 (-0.001580665) #
       6.344272748 (-0.000013854) #
       6.343548854 (-0.000737748) #
       6.345688749 (+0.001402147) #
       6.345740034 (+0.001453432) #
       6.342946547 (-0.001340055) #
       6.345259014 (+0.000972412) #
       6.343988667 (-0.000297935) #
       6.343001179 (-0.001285423) #
       6.345858767 (+0.001572165) #
       6.346715240 (+0.002428638) #
       6.343960544 (-0.000326058) #
       6.342118848 (-0.002167754) #
       6.340648947 (-0.003637655) #
       6.350686432 (+0.006399830) #

       # Final result:
       6.344286602 +- 0.000475553 seconds time elapsed  ( +-  0.01% )

```

## mod_inverse-defensive cpp
```txt
# started on Tue Jun 16 12:59:33 2026


 Performance counter stats for './cpp-mod_inverse-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
               132      page-faults:u                    #     22.5 faults/sec  page_faults_per_second  ( +-  0.13% )
          5,878.08 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
     1,392,629,117      branch-misses:u                  #     25.7 %  branch_miss_rate         ( +-  0.01% )  (49.99%)
     5,417,026,185      branches:u                       #    921.6 M/sec  branch_frequency     ( +-  0.00% )  (49.98%)
    32,299,827,408      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.01% )  (66.64%)
    49,635,250,126      instructions:u                   #      1.5 instructions  insn_per_cycle  ( +-  0.00% )  (50.01%)
     9,685,622,742      stalled-cycles-frontend:u        #     0.30 frontend_cycles_idle        ( +-  0.02% )  (50.02%)

       # Table of individual measurements:
       5.877957119 (-0.001152323) #
       5.875310556 (-0.003798887) #
       5.877529790 (-0.001579653) #
       5.883901805 (+0.004792362) #
       5.881355109 (+0.002245667) #
       5.878753420 (-0.000356023) #
       5.875683054 (-0.003426389) #
       5.882184661 (+0.003075219) #
       5.876680350 (-0.002429092) #
       5.876492519 (-0.002616923) #
       5.876818358 (-0.002291084) #
       5.874315764 (-0.004793678) #
       5.882280681 (+0.003171239) #
       5.879546353 (+0.000436911) #
       5.876049609 (-0.003059834) #
       5.882670972 (+0.003561529) #
       5.884401090 (+0.005291647) #
       5.874283113 (-0.004826330) #
       5.884170999 (+0.005061557) #
       5.881803528 (+0.002694085) #

       # Final result:
       5.879109442 +- 0.000769540 seconds time elapsed  ( +-  0.01% )

```

