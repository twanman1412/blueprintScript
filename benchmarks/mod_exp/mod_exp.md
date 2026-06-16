# Benchmark Results: mod_exp

## mod_exp
```txt
# started on Tue Jun 16 12:45:33 2026


 Performance counter stats for './mod_exp' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #     10.9 faults/sec  page_faults_per_second  ( +-  0.19% )
          5,515.43 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.02% )
       943,884,330      branch-misses:u                  #     25.7 %  branch_miss_rate         ( +-  0.01% )  (50.00%)
     3,671,741,810      branches:u                       #    665.7 M/sec  branch_frequency     ( +-  0.00% )  (50.02%)
    30,235,787,560      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.00% )  (66.69%)
    55,708,829,016      instructions:u                   #      1.8 instructions  insn_per_cycle  ( +-  0.00% )  (50.00%)
     6,443,928,747      stalled-cycles-frontend:u        #     0.21 frontend_cycles_idle        ( +-  0.08% )  (49.98%)

       # Table of individual measurements:
       5.511402699 (-0.005062261) #
       5.521320080 (+0.004855120) #
       5.521870120 (+0.005405160) #
       5.510673385 (-0.005791575) #
       5.516858230 (+0.000393270) #
       5.511433487 (-0.005031473) #
       5.516384403 (-0.000080557) #
       5.516912913 (+0.000447953) #
       5.515770665 (-0.000694295) #
       5.517759697 (+0.001294737) #
       5.520963172 (+0.004498212) #
       5.520311413 (+0.003846453) #
       5.518828648 (+0.002363688) #
       5.520118382 (+0.003653422) #
       5.520266609 (+0.003801649) #
       5.513677837 (-0.002787123) #
       5.513717843 (-0.002747117) #
       5.513864467 (-0.002600493) #
       5.508808404 (-0.007656556) #
       5.518356744 (+0.001891784) #

       # Final result:
       5.516464960 +- 0.000877328 seconds time elapsed  ( +-  0.02% )

```

## mod_exp-defensive
```txt
# started on Tue Jun 16 12:47:24 2026


 Performance counter stats for './mod_exp-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #     10.8 faults/sec  page_faults_per_second  ( +-  0.24% )
          5,580.01 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
       945,022,974      branch-misses:u                  #     25.7 %  branch_miss_rate         ( +-  0.00% )  (49.98%)
     3,671,740,611      branches:u                       #    658.0 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
    30,575,118,532      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.00% )  (66.68%)
    58,652,617,293      instructions:u                   #      1.9 instructions  insn_per_cycle  ( +-  0.00% )  (50.02%)
     5,834,084,946      stalled-cycles-frontend:u        #     0.19 frontend_cycles_idle        ( +-  0.01% )  (50.00%)

       # Table of individual measurements:
       5.587051221 (+0.006136991) #
       5.583508710 (+0.002594480) #
       5.584511157 (+0.003596927) #
       5.578078648 (-0.002835582) #
       5.581384224 (+0.000469994) #
       5.577715228 (-0.003199002) #
       5.578028444 (-0.002885786) #
       5.574450368 (-0.006463862) #
       5.578914212 (-0.002000018) #
       5.584277179 (+0.003362949) #
       5.580128424 (-0.000785806) #
       5.578693799 (-0.002220431) #
       5.583887459 (+0.002973229) #
       5.583053769 (+0.002139539) #
       5.582562510 (+0.001648280) #
       5.582923405 (+0.002009175) #
       5.581167779 (+0.000253549) #
       5.581126001 (+0.000211771) #
       5.579784501 (-0.001129729) #
       5.577037559 (-0.003876671) #

       # Final result:
       5.580914230 +- 0.000694677 seconds time elapsed  ( +-  0.01% )

```

## mod_exp cpp
```txt
# started on Tue Jun 16 12:49:16 2026


 Performance counter stats for './cpp-mod_exp' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
               132      page-faults:u                    #     32.6 faults/sec  page_faults_per_second  ( +-  0.17% )
          4,046.62 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.03% )
       946,900,535      branch-misses:u                  #     25.2 %  branch_miss_rate         ( +-  0.00% )  (49.97%)
     3,750,656,620      branches:u                       #    926.9 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
    22,235,292,810      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.03% )  (66.66%)
    34,328,110,296      instructions:u                   #      1.5 instructions  insn_per_cycle  ( +-  0.00% )  (50.03%)
     6,516,353,753      stalled-cycles-frontend:u        #     0.29 frontend_cycles_idle        ( +-  0.06% )  (50.00%)

       # Table of individual measurements:
       4.049949096 (+0.002488277) #
       4.052395425 (+0.004934606) #
       4.042359823 (-0.005100996) #
       4.044747752 (-0.002713067) #
       4.042146273 (-0.005314546) #
       4.046118297 (-0.001342522) #
       4.053860567 (+0.006399748) #
       4.043151104 (-0.004309715) #
       4.050685204 (+0.003224385) #
       4.053350172 (+0.005889353) #
       4.042886008 (-0.004574811) #
       4.042742960 (-0.004717859) #
       4.047904841 (+0.000444022) #
       4.042246801 (-0.005214018) #
       4.053314465 (+0.005853646) #
       4.053826944 (+0.006366125) #
       4.043760855 (-0.003699964) #
       4.050717524 (+0.003256705) #
       4.052060127 (+0.004599308) #
       4.040992133 (-0.006468686) #

       # Final result:
       4.047460819 +- 0.001065286 seconds time elapsed  ( +-  0.03% )

```

## mod_exp-defensive cpp
```txt
# started on Tue Jun 16 12:50:37 2026


 Performance counter stats for './cpp-mod_exp-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
               132      page-faults:u                    #     33.1 faults/sec  page_faults_per_second  ( +-  0.14% )
          3,982.12 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
       950,124,500      branch-misses:u                  #     25.5 %  branch_miss_rate         ( +-  0.00% )  (50.00%)
     3,719,821,444      branches:u                       #    934.1 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
    21,880,448,208      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.01% )  (66.67%)
    34,268,188,395      instructions:u                   #      1.6 instructions  insn_per_cycle  ( +-  0.00% )  (50.00%)
     6,631,189,849      stalled-cycles-frontend:u        #     0.30 frontend_cycles_idle        ( +-  0.02% )  (50.00%)

       # Table of individual measurements:
       3.980595226 (-0.002378979) #
       3.980830447 (-0.002143758) #
       3.981357863 (-0.001616342) #
       3.987900669 (+0.004926464) #
       3.981372481 (-0.001601724) #
       3.981578847 (-0.001395358) #
       3.983296122 (+0.000321917) #
       3.982411245 (-0.000562960) #
       3.983521142 (+0.000546937) #
       3.983536081 (+0.000561876) #
       3.985239558 (+0.002265353) #
       3.982431183 (-0.000543022) #
       3.983295339 (+0.000321134) #
       3.984166650 (+0.001192445) #
       3.981573267 (-0.001400938) #
       3.982271032 (-0.000703173) #
       3.985090350 (+0.002116145) #
       3.982312791 (-0.000661414) #
       3.981804339 (-0.001169866) #
       3.984899462 (+0.001925257) #

       # Final result:
       3.982974205 +- 0.000404206 seconds time elapsed  ( +-  0.01% )

```

