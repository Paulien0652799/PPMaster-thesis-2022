setwd("name_directory")

require(devtools)
install_github("madoui/metaVaR")
require(metaVaR)

## espilon values to test for dbscan
e = c(5,8,10,11,12,13,14,15,16)
## minimum points values to test for dbscan
p = c(5,10,20,40,80,160,250,320)

freq <- read.csv("F.prefix_freq.txt", header = FALSE, sep = "\t")
cov <- read.csv("F.prefix_cov.txt", header = FALSE, sep = "\t")
colnames(freq) <- c("locus", "Apr.", "Aug.", "Feb.", "Dec.", "Jan.", "Jul.", "Jun.", "Mar.", "May", "Nov.", "Oct.", "Sep.")
colnames(cov) <- c("locus", "Apr.", "Aug.", "Feb.", "Dec.", "Jan.", "Jul.", "Jun.", "Mar.", "May", "Nov.", "Oct.", "Sep.")
freq_1 <- freq[c("locus", "Jan.", "Feb.", "Mar.", "Apr.", "May", "Jun.", "Jul.", "Aug.", "Sep.", "Oct.", "Nov.", "Dec.")]
cov_1 <- cov[c("locus", "Jan.", "Feb.", "Mar.", "Apr.", "May", "Jun.", "Jul.", "Aug.", "Sep.", "Oct.", "Nov.", "Dec.")]

## Test all dbscan parameter couples
MVC_list = tryParam (e, p, cov_1[,-1])

## Select maximum weigthed independant sets
MWIS = getMWIS (MVC_list)

## Filter loci to generate MVS
MVS = mvc2mvs(MWIS, freq = freq_1[,-1])

## store MVC in direcotry
writeMvcList (MVC_list, "MVC_name")

#### igraph is necessary for neighbors function
install.packages("igraph")
require(igraph)

MWIS_list = getMWIS (MVC_list)

MVS_list = mvc2mvs(MWIS_list, freq = freq_1[,-1])

## store MVS in directory
writeMvsList (MVS_list, "MVS_name")



## Plot the MVS distribution of allele frequency, 1 can be replaced by the number of the MVC
plotMvs (MVS[[1]], type = "freq")

## Plot the MVS loci depth of coverage
plotMvs (MVS[[1]], type = "cov")

## Plot the pairwise FST matrix
plotMvs (MVS[[1]], type = "heatFst")

## Plot the expected and observed LK distribution
plotMvs (MVS[[1]], type = "LK")

## Print score of an MVS
print(MVS[[1]]@score)

## Print corresponding epsilon-values of an MVS
print(MVS[[1]]@eps)

## Print corresponding pmin-values of an MVS
print(MVS[[1]]@pts)

## See which months are included in an MVS
print(MVS[[1]]@pop)

## Check the degrees of freedom of estimated chi-squared distribution of an MVS
print(MVS[[1]]@deg)
