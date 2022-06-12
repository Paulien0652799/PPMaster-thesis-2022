#!/bin/bash

start=$SECONDS

for filename in *_1.fastq.gz
do
# define base name
        base=$(basename $filename _1.fastq.gz)
        echo $base

# trim reads
        trimmomatic PE -phred33 ${base}_1.fastq.gz ${base}_2.fastq.gz \
                ${base}_R1_paired.fastq.gz ${base}_R1_unpaired.fastq.gz \
                ${base}_R2_paired.fastq.gz ${base}_R2_unpaired.fastq.gz \
                LEADING:3 TRAILING:3 \
                SLIDINGWINDOW:4:15 \
                MINLEN:100

# merge reads
		pear -f ${base}_R1_paired.fastq.gz -r ${base}_R2_paired.fastq.gz \
		-o ${base}

# convert to fasta and compress all files		
		sed -n '1~4s/^@/>/p;2~4p' ${base}.assembled.fastq > ${base}.assembled.fasta

# compress files		
		gzip ${base}*
		
done

end=$SECONDS
duration=$(( end - start ))
echo "All good! It took the script $(($duration/60)) minutes and $(($duration%60)) seconds to complete the job."

