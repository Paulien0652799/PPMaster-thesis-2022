# Pipeline DiscoSnp - metavarFilter - MetaVaR
This repository is made by Paulien Philippe, a biology student at KU Leuven, on 15th of June 2022. It contains the scripts from the pipeline (see image) that is described in my Master's thesis. The intermediate and end results per step can be found on this [drive](https://mega.nz/folder/I3JSSIha#WD5ZbvjewGbjBaftEVtrjA).
The pipeline was used to perform a reference-free and metagenomic-based population genomic analysis on a photosynthetic picoeukaryote community.

## Data preparation
To download the raw reads, the script **_Download data_** can be run on the file **_all.reads.csv_**. This file contains the information of every sample taken by Rashid et al. (2018) so the raw reads can be downloaded from the DNA Data Bank of Japan (DDBJ). The reads will be stored in 72 seperate .gz files.

The script **_Data_prep.sh_** trims the reads to get rid of undersequenced ends of reads and merges them together per month. After zipping, this step yields 12 files in gz format.

## DiscoSnp++
To run DiscoSnp++, the script **_DiscoSnp++.sh_** should be used. To repeat the exact same analysis, there are three different *run_discoSnp++.sh* scripts that DiscoSnp++.sh can refer to.
1. With a coverage of three: **_3_run_discoSnp++.sh_**
2. With a coverage of eight and no smart branching: **_8_NSB_run_discoSnp++.sh_**
3. With a coverage of eight and with smart branching: **_8_SB_run_discoSnp++.sh_**

To run DiscoSnp++ with either of the reference genomes, an extra parameter should be added (-G) with the file of the reference genomes stored in the zip files.
For example:
``` 
./run_di./run_discoSnp++.sh -r fof.txt -T  -G Micromonas_commoda.fna
``` 

**_fof.txt_** contains 12 lines to refer to the 12 .gz file made in the data preparation step.
This is the [link to the GitHub page of DiscoSnp++](https://github.com/GATB/DiscoSnp) (Peterlongo et al., 2017)

## MetavarFilter
**_Command metavarFilter_** should be run on the command line with the perl script **_metaVarFilter.pl_** in the same directory.

## MetaVaR
The R script **_MetaVaR.R_** provides the code to meaningfully cluster the variants based on the allele frequency and the depth of coverage matrices that were produced in the previous step. It also contains the code to reproduce the plots.
This is the [link to the GitHub page of MetaVaR and metavarFilter](https://github.com/madoui/metaVaR) (Laso-Jadart et al., 2020)

![](informatic%20pipeline.jpeg)
## References
- Laso-Jadart, R., Ambroise, C., Peterlongo, P., & Madoui, M.-A. (2020). metaVaR: Introducing metavariant species models for reference-free metagenomic-based population genomics. PLOS ONE, 15(12), e0244637. https://doi.org/10.1371/journal.pone.0244637
- Peterlongo Pierre, Riou Chloé, Drezen Erwan, & Lemaitre Claire. (2017). DiscoSnp++: de novo detection of small variants from raw unassembled read set(s). BioRxiv, 209965, 1–8. https://doi.org/10.1101/209965
- Rashid, J., Kobiyama, A., Reza, M. S., Yamada, Y., Ikeda, Y., Ikeda, D., Mizusawa, N., Ikeo, K., Sato, S., Ogata, T., Kudo, T., Kaga, S., Watanabe, S., Naiki, K., Kaga, Y., Mineta, K., Bajic, V., Gojobori, T., & Watabe, S. (2018). Seasonal changes in the communities of photosynthetic picoeukaryotes in Ofunato Bay as revealed by shotgun metagenomic sequencing. Gene, 665, 127–132. https://doi.org/10.1016/j.gene.2018.04.071
