BGI_ID=20A_V100002704 
SAMPLE_ID=C0072_A9

# Set of sample index barcodes from 10x Genomics
declare -a INDEX_BARCODES=(TCTTAAAG CGAGGCTC GTCCTTCT AAGACGGA)

# Loop to iterate through each set of files, to attach cell barcodes per sample
for N in {1..4}; do
    for M in {1..4}; do
        INPUT_FILE_R1=${BGI_ID}_L0${N}_${SAMPLE_ID}_${M}_1.fq.gz
        INPUT_FILE_R2=${BGI_ID}_L0${N}_${SAMPLE_ID}_${M}_2.fq.gz
	    INDEX_NUMBER=$(($M - 1 ))
        BARCODE=${INDEX_BARCODES[$INDEX_NUMBER]}
        OUTPUT_FILE_R1=${SAMPLE_ID}_${BARCODE}_L00${N}_R1.fastq.gz
        OUTPUT_FILE_R2=${SAMPLE_ID}_${BARCODE}_L00${N}_R2.fastq.gz
        python convertHeaders.py -i ./MGI/$INPUT_FILE_R1 -o ./MGI/converted_MGI/$OUTPUT_FILE_R1 -b $BARCODE
        python convertHeaders.py -i ./MGI/$INPUT_FILE_R2 -o ./MGI/converted_MGI/$OUTPUT_FILE_R2 -b $BARCODE
    done
done