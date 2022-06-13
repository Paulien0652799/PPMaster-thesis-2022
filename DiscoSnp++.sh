#!/bin/bash

start=$SECONDS

# run DiscoSNP++
./run_discoSnp++.sh -r fof.txt -T

end=$SECONDS
duration=$(( end - start ))
echo "All good! It took the script $(($duration/60)) minutes and $(($duration%60)) seconds to complete the job."
