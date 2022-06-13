# Pipeline DiscoSnp - metavarFilter - MetaVaR
This repository is made by Paulien Philippe, a biology student at the KU Leuven, on 15th of June 2022. It contains the scripts from the pipeline that is described in my Master's thesis. The intermediate results and raw end results can be found on this [drive](https://mega.nz/folder/I3JSSIha#WD5ZbvjewGbjBaftEVtrjA).
The pipeline was used to perform a reference-free and metagenomic-based population genomic analysis on a photosynthetic picoeukaryote community.

## Data preparation
To download the raw reads, the script **_Download data_** can be run on the file **_all.reads.csv_**. This file contains the information of every sample taken by Rashid et al. (2018) so the raw reads can be downloaded from the DNA Data Bank of Japan (DDBJ). The reads will be stored in 72 seperate .gz files.

The script **_Data_prep.sh_** trims the reads to get rid of undersequenced ends of reads and merges them together per month. After zipping, this step yield 12 files in gz format.

## DiscoSnp++
To run DiscoSnp++, the script **_DiscoSnp++.sh_** should be used. To repeat the exact same analysis, there are three different *run_discoSnp++.sh* scripts.
1. With a coverage of three: **_3_run_discoSnp++.sh_**
2. With a coverage of eight and no smart branching: **_8_NSB_run_discoSnp++.sh_**
3. With a coverage of eight and with smart branching: **_8_SB_run_discoSnp++.sh_**
