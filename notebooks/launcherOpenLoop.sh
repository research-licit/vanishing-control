#!/usr/bash

PATH_SYMUVIA="/home/ladino/dev-symuvia/build/lib/libSymuVia.so"
IT=0

# Case Open Loop 
case="OPENL"

# Scenario A
echo "papermill 01_Zone_Control.ipynb 01_Zone_Control_${case}_5x5_dA.ipynb \
-p PATH_SYMUVIA ${PATH_SYMUVIA} \
-p EXPERIMENT CTR_SCNA${case} \
-p CTR_ALG ${case} \
-p CONTROL_MODE ${case} \
-p FILE "manhattan_grid_5X5_A.xml" \
-p DEMAND_FILE "demand_scenario_A.csv" &"
papermill 01_Zone_Control.ipynb 01_Zone_Control_${case}_5x5_dA.ipynb \
-p PATH_SYMUVIA ${PATH_SYMUVIA} \
-p EXPERIMENT CTR_SCNA${case} \
-p CTR_ALG ${case} \
-p CONTROL_MODE ${case} \
-p FILE "manhattan_grid_5X5_A.xml" \
-p DEMAND_FILE "demand_scenario_A.csv" &

IT=$((IT+1))

# Scenario B
echo "papermill 01_Zone_Control.ipynb 01_Zone_Control_${case}_5x5_dB.ipynb \
-p PATH_SYMUVIA ${PATH_SYMUVIA} \
-p EXPERIMENT CTR_SCNB${case} \
-p CTR_ALG ${case} \
-p CONTROL_MODE ${case} \
-p FILE "manhattan_grid_5X5_B.xml" \
-p DEMAND_FILE "demand_scenario_B.csv" &"
papermill 01_Zone_Control.ipynb 01_Zone_Control_${case}_5x5_dB.ipynb \
-p PATH_SYMUVIA ${PATH_SYMUVIA} \
-p EXPERIMENT CTR_SCNB${case} \
-p CTR_ALG ${case} \
-p CONTROL_MODE ${case} \
-p FILE "manhattan_grid_5X5_B.xml" \
-p DEMAND_FILE "demand_scenario_B.csv" &

IT=$((IT+1))

echo "Total Simulations: ${IT}"