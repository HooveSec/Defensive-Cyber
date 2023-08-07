# Differential Analysis Script
# Make Initial Baseline  
# get-service > baseline-services-20230807.txt
# Day of 
get-service > services-liveinvestigation.txt
$baseline = Get-content baseline-services-20230807.txt
$current = get-content services-liveinvestigation.txt
compare-object -referenceobject $baseline -differenceobject $current 