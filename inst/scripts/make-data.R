### =========================================================================
### make-data.R
### -------------------------------------------------------------------------
###
### Builds the TxDb SQLite database distributed with this package through
### AnnotationHub, from the official Rice Genome Annotation Project (RGAP)
### Release 7 GFF3 annotation (MSU7, genome assembly IRGSP-1.0).
###
### The resulting file, TxDb.Osativa.MSU.RGAP7.sqlite, is deposited on Zenodo
### (record 21783295) and referenced from inst/extdata/metadata.csv.
###
### Not run at build or check time; kept here for provenance and
### reproducibility, as required for AnnotationHub packages.
###

### RICE GTF
library(Biostrings)
library(GenomicFeatures)
library(txdbmaker)

# ----------------------------------------------------------------------
# 1. Define paths and parameters
# ----------------------------------------------------------------------
# --- File paths (adjust as needed) ---
# Below files were downloaded from below link
# https://rice.uga.edu/pub/data/Eukaryotic_Projects/o_sativa/annotation_dbs/pseudomolecules/version_7.0/all.dir/all.gff3

rice_gff_file <- "MSU7_all.gff3"

output_sqlite <- "TxDb.Osativa.MSU.RGAP7.sqlite"

organism_name <- "Oryza sativa"
taxonomy_id   <- 4530
genome_assembly <- "IRGSP-1.0"

# ----------------------------------------------------------------------
# 2. Define chrominfo (chromosome lengths and circularity)
# Verified from your earlier SQLite inspection
# ----------------------------------------------------------------------
# Downloaded the fasta sequence from the same link
genome <- readDNAStringSet("osa1_r7.asm.fa.gz")
names(genome)
width(genome)

chrominfo <- data.frame(
  chrom = names(genome),
  length = width(genome),
  is_circular = rep(FALSE, length(genome))
)

chrominfo
#unanchored (ChrUn) and Syngenta (ChrSy) pseudomolecules

# ----------------------------------------------------------------------
# 3. Build the TxDb object
# ----------------------------------------------------------------------
rice_txdb <- suppressWarnings(
  makeTxDbFromGFF(
    file       = rice_gff_file,
    format     = "gff3",
    dataSource = paste("Rice Genome Annotation Project"),
    organism   = organism_name,
    taxonomyId = taxonomy_id,
    chrominfo  = chrominfo
  )
)

# ----------------------------------------------------------------------
# 5. Fix genome assignment
# ----------------------------------------------------------------------
genome(seqinfo(rice_txdb)) <- genome_assembly

# ----------------------------------------------------------------------
# 6. Save to SQLite file
# ----------------------------------------------------------------------
saveDb(rice_txdb, output_sqlite)

# ----------------------------------------------------------------------
# 7. Quick validation
# ----------------------------------------------------------------------
cat("TxDb saved to:", output_sqlite, "/n")
cat("Number of transcripts:", length(transcripts(rice_txdb)), "/n")
cat("Number of exons:", length(exons(rice_txdb)), "/n")
cat("Number of genes:", length(genes(rice_txdb)), "/n")
print(seqinfo(rice_txdb))
