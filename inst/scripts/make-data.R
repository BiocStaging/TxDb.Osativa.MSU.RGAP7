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

library(txdbmaker)
library(AnnotationDbi)

GFF_URL <- paste0("https://rice.uga.edu/pub/data/Eukaryotic_Projects/",
                  "o_sativa/annotation_dbs/pseudomolecules/version_7.0/",
                  "all.dir/all.gff3")

gff_file <- file.path(tempdir(), "all.gff3")
download.file(GFF_URL, gff_file, mode = "wb")

txdb <- txdbmaker::makeTxDbFromGFF(
    file = gff_file,
    format = "gff3",
    dataSource = GFF_URL,
    organism = "Oryza sativa",
    taxonomyId = 4530
)

AnnotationDbi::saveDb(txdb, file = "TxDb.Osativa.MSU.RGAP7.sqlite")
