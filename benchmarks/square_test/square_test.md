# Benchmark Results: square_test

## square_test
```txt
# started on Wed Jun  3 14:45:20 2026


 Performance counter stats for './square_test' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      5.1 faults/sec  page_faults_per_second  ( +-  0.40% )
         11,659.60 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.04% )
         9,909,486      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  0.01% )  (49.99%)
    21,107,484,983      branches:u                       #   1810.3 M/sec  branch_frequency     ( +-  0.00% )  (50.00%)
    63,446,701,529      cpu-cycles:u                     #      5.4 GHz  cycles_frequency       ( +-  0.02% )  (66.67%)
   190,074,703,651      instructions:u                   #      3.0 instructions  insn_per_cycle  ( +-  0.00% )  (50.01%)
       124,904,650      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  7.44% )  (50.00%)

      # Table of individual measurements:
      11.639580814 (-0.021339748) #
      11.662050708 (+0.001130146) #
      11.632903933 (-0.028016629) #
      11.667853514 (+0.006932952) #
      11.629425965 (-0.031494597) #
      11.681496789 (+0.020576227) #
      11.674359898 (+0.013439336) #
      11.640360628 (-0.020559934) #
      11.685844381 (+0.024923819) #
      11.684672049 (+0.023751487) #
      11.680532932 (+0.019612370) #
      11.681151502 (+0.020230940) #
      11.624663006 (-0.036257556) #
      11.642213188 (-0.018707374) #
      11.676196380 (+0.015275818) #
      11.650918802 (-0.010001760) #
      11.646566502 (-0.014354060) #
      11.671395459 (+0.010474897) #
      11.671843350 (+0.010922788) #
      11.674381431 (+0.013460869) #

      # Final result:
      11.660920562 +- 0.004560058 seconds time elapsed  ( +-  0.04% )

```

## square_test-defensive
```txt
# started on Wed Jun  3 14:49:14 2026


 Performance counter stats for './square_test-defensive' (20 runs):

                 0      context-switches:u               #      0.0 cs/sec  cs_per_second     
                 0      cpu-migrations:u                 #      0.0 migrations/sec  migrations_per_second
                60      page-faults:u                    #      5.2 faults/sec  page_faults_per_second  ( +-  0.28% )
         11,649.71 msec task-clock:u                     #      1.0 CPUs  CPUs_utilized         ( +-  0.05% )
         9,906,582      branch-misses:u                  #      0.0 %  branch_miss_rate         ( +-  0.01% )  (49.99%)
    21,107,673,004      branches:u                       #   1811.9 M/sec  branch_frequency     ( +-  0.00% )  (50.01%)
    63,415,563,965      cpu-cycles:u                     #      5.4 GHz  cycles_frequency       ( +-  0.01% )  (66.67%)
   190,077,570,782      instructions:u                   #      3.0 instructions  insn_per_cycle  ( +-  0.00% )  (50.01%)
        96,727,043      stalled-cycles-frontend:u        #     0.00 frontend_cycles_idle        ( +-  1.98% )  (49.99%)

      # Table of individual measurements:
      11.669161985 (+0.017958409) #
      11.674167942 (+0.022964366) #
      11.679307027 (+0.028103451) #
      11.679913608 (+0.028710032) #
      11.677930238 (+0.026726662) #
      11.644034172 (-0.007169404) #
      11.661128695 (+0.009925119) #
      11.666230965 (+0.015027389) #
      11.683225598 (+0.032022022) #
      11.640030208 (-0.011173368) #
      11.673915230 (+0.022711654) #
      11.670065174 (+0.018861598) #
      11.645077866 (-0.006125710) #
      11.621480597 (-0.029722979) #
      11.618876326 (-0.032327250) #
      11.627668008 (-0.023535568) #
      11.618953125 (-0.032250451) #
      11.617685647 (-0.033517929) #
      11.618484180 (-0.032719396) #
      11.636734926 (-0.014468650) #

      # Final result:
      11.651203576 +- 0.005510567 seconds time elapsed  ( +-  0.05% )

```

