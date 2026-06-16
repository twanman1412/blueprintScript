# Benchmark Results: naive_dlog

## naive_dlog
```txt
# started on Tue Jun 16 13:01:31 2026


 Performance counter stats for './naive_dlog' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      5.5 faults/sec  page_faults_per_second  ( +-  0.25% )
         10,822.07 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
           704,957      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  0.31% )  (50.00%)
    15,078,692,930      branches:u                       #   1393.3 M/sec  branch_frequency     ( +-  0.00% )  (49.99%)
    59,498,172,462      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.01% )  (66.66%)
   146,193,559,963      instructions:u                   #      2.5 instructions  insn_per_cycle  ( +-  0.00% )  (50.00%)
        15,067,510      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  0.93% )  (50.01%)

      # Table of individual measurements:
      10.824035519 (+0.000605142) #
      10.831467689 (+0.008037312) #
      10.819259199 (-0.004171178) #
      10.820292293 (-0.003138084) #
      10.819530758 (-0.003899619) #
      10.827849126 (+0.004418749) #
      10.820565655 (-0.002864722) #
      10.823130535 (-0.000299842) #
      10.824390894 (+0.000960517) #
      10.829850542 (+0.006420165) #
      10.820564332 (-0.002866045) #
      10.813113788 (-0.010316589) #
      10.825869421 (+0.002439044) #
      10.821355704 (-0.002074673) #
      10.818897433 (-0.004532944) #
      10.820676342 (-0.002754035) #
      10.823538980 (+0.000108603) #
      10.831762430 (+0.008332053) #
      10.822985093 (-0.000445284) #
      10.829471813 (+0.006041436) #

      # Final result:
      10.823430377 +- 0.001071822 seconds time elapsed  ( +-  0.01% )

```

## naive_dlog-defensive
```txt
# started on Tue Jun 16 13:05:07 2026


 Performance counter stats for './naive_dlog-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      4.5 faults/sec  page_faults_per_second  ( +-  0.22% )
         13,277.11 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
           702,413      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  0.39% )  (49.99%)
    10,078,360,501      branches:u                       #    759.1 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
    73,003,347,723      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.00% )  (66.67%)
   136,253,617,886      instructions:u                   #      1.9 instructions  insn_per_cycle  ( +-  0.00% )  (50.01%)
        17,477,598      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  0.95% )  (50.00%)

      # Table of individual measurements:
      13.276738789 (-0.001982743) #
      13.274516800 (-0.004204732) #
      13.276260453 (-0.002461079) #
      13.274400241 (-0.004321291) #
      13.277583188 (-0.001138344) #
      13.279198011 (+0.000476479) #
      13.276400435 (-0.002321097) #
      13.285179145 (+0.006457613) #
      13.284531643 (+0.005810111) #
      13.280147257 (+0.001425725) #
      13.287211608 (+0.008490076) #
      13.281796303 (+0.003074771) #
      13.277397922 (-0.001323610) #
      13.280086835 (+0.001365303) #
      13.279296135 (+0.000574603) #
      13.275605818 (-0.003115714) #
      13.278599762 (-0.000121770) #
      13.280011153 (+0.001289621) #
      13.274403087 (-0.004318445) #
      13.275066058 (-0.003655474) #

      # Final result:
      13.278721532 +- 0.000826568 seconds time elapsed  ( +-  0.01% )

```

## naive_dlog cpp
```txt
# started on Tue Jun 16 13:09:33 2026


 Performance counter stats for './cpp-naive_dlog' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
               132      page-faults:u                    #     11.1 faults/sec  page_faults_per_second  ( +-  0.11% )
         11,902.72 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
           730,639      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  0.54% )  (49.99%)
    15,076,984,580      branches:u                       #   1266.7 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
    65,436,624,768      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.00% )  (66.67%)
    95,799,931,269      instructions:u                   #      1.5 instructions  insn_per_cycle  ( +-  0.00% )  (50.01%)
        16,146,066      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  0.76% )  (50.00%)

      # Table of individual measurements:
      11.904856314 (+0.000562215) #
      11.905590628 (+0.001296529) #
      11.908118148 (+0.003824049) #
      11.904432110 (+0.000138011) #
      11.905319310 (+0.001025211) #
      11.908754349 (+0.004460250) #
      11.908315517 (+0.004021418) #
      11.910476912 (+0.006182813) #
      11.897931914 (-0.006362185) #
      11.900878289 (-0.003415810) #
      11.902944265 (-0.001349834) #
      11.899951243 (-0.004342856) #
      11.907805803 (+0.003511704) #
      11.902208087 (-0.002086012) #
      11.905272422 (+0.000978323) #
      11.902151671 (-0.002142428) #
      11.904317695 (+0.000023596) #
      11.901605259 (-0.002688840) #
      11.903452637 (-0.000841462) #
      11.901499400 (-0.002794699) #

      # Final result:
      11.904294099 +- 0.000730520 seconds time elapsed  ( +-  0.01% )

```

## naive_dlog-defensive cpp
```txt
# started on Tue Jun 16 13:13:32 2026


 Performance counter stats for './cpp-naive_dlog-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
               132      page-faults:u                    #     11.1 faults/sec  page_faults_per_second  ( +-  0.17% )
         11,900.15 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.01% )
           743,522      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  0.62% )  (50.00%)
    10,076,328,573      branches:u                       #    846.7 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
    65,430,946,531      cpu-cycles:u                     #      5.5 GHz  cycles_frequency       ( +-  0.00% )  (66.67%)
    85,787,161,649      instructions:u                   #      1.3 instructions  insn_per_cycle  ( +-  0.00% )  (50.00%)
        16,425,116      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  0.88% )  (50.00%)

      # Table of individual measurements:
      11.907269981 (+0.005801244) #
      11.902653050 (+0.001184313) #
      11.906371580 (+0.004902843) #
      11.901998315 (+0.000529578) #
      11.900597954 (-0.000870783) #
      11.901224576 (-0.000244161) #
      11.900332787 (-0.001135950) #
      11.901301851 (-0.000166886) #
      11.903422601 (+0.001953864) #
      11.898828101 (-0.002640636) #
      11.898436808 (-0.003031929) #
      11.910054582 (+0.008585845) #
      11.900147781 (-0.001320956) #
      11.898266530 (-0.003202207) #
      11.900030562 (-0.001438175) #
      11.898546965 (-0.002921772) #
      11.900075386 (-0.001393351) #
      11.904313988 (+0.002845251) #
      11.897608659 (-0.003860078) #
      11.897892690 (-0.003576047) #

      # Final result:
      11.901468737 +- 0.000753135 seconds time elapsed  ( +-  0.01% )

```

