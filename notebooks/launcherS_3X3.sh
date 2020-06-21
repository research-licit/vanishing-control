#!/usr/bash

PATH_SYMUVIA="/home/ladino/dev-symuvia/build/lib/libSymuVia.so"
IT=0

# Sensitivity Kp: 

# Scenario B

case="P"
td=0.0

for d in 400 600 800 1200
do 
for k in 0.2 0.3 0.4 0.5 0.6 0.7
do
    echo "papermill 01_Zone_Control.ipynb 01_Zone_Control_${case}_KP_${k}_SCNBD${d}_3X3.ipynb \
    -p PATH_SYMUVIA ${PATH_SYMUVIA} \
    -p EXPERIMENT manhattan_B_V2_3_${d}_3X3_${case}_${k}_X_X_X \
    -p CTR_ALG ${case} \
    -p KP ${k} \
    -p TD ${td} \
    -p DISTANCE_CONTROL ${d} \
    -p ZONES "9zones/"
    -p FILE "manhattan_grid_3X3_scenario_B.xml" \
    -p DEMAND_FILE "demand_scenario_B.csv" \
    -p REF_SPEED "ref_speeds_3X3.csv" &"
    IT=$((IT+1))
    papermill 01_Zone_Control.ipynb 01_Zone_Control_${case}_KP_${k}_SCNBD${d}_3X3.ipynb \
    -p PATH_SYMUVIA ${PATH_SYMUVIA} \
    -p EXPERIMENT manhattan_B_V2_3_${d}_3X3_${case}_${k}_X_X_X \
    -p CTR_ALG ${case} \
    -p KP ${k} \
    -p TD ${td} \
    -p DISTANCE_CONTROL ${d} \
    -p ZONES "9zones/"
    -p FILE "manhattan_grid_3X3_scenario_B.xml" \
    -p DEMAND_FILE "demand_scenario_B.csv" \
    -p REF_SPEED "ref_speeds_3X3.csv" &
done
done

echo "Total Simulations: ${IT}"