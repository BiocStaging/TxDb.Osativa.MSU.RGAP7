# TxDb.Osativa.MSU.RGAP7

TxDb.Osativa.MSU.RGAP7 is a Bioconductor-compatible transcript annotation database generated from the official MSU Rice Genome Annotation Project Release 7 (RGAP7) GFF3 annotation. It provides gene, transcript, exon, CDS, and genomic feature annotations for Oryza sativa (Nipponbare, IRGSP-1.0/MSU7).

## Installation

```r
if (!requireNamespace("BiocManager", quietly = TRUE)) {
    install.packages("BiocManager")
}
BiocManager::install(c("AnnotationHub", "GenomicFeatures"))
```

## Usage

The TxDb object is not shipped inside the package; it is hosted on
AnnotationHub and downloaded on first use.

```r
library(TxDb.Osativa.MSU.RGAP7)
library(AnnotationHub)
library(GenomicFeatures)

ah <- AnnotationHub()
txdb <- ah[["AH122276"]]

genes(txdb)
head(transcripts(txdb))
exonsBy(txdb, by = "tx")
```

### Converting MSU identifiers to RAP-DB identifiers

Gene models are keyed by MSU locus identifiers (`LOC_Os##g#####`). Use
`msu_to_rap()` to translate them to RAP-DB identifiers (`Os##g#######`);
input order is preserved and unconvertible identifiers are dropped. Requires
the `riceidconverter` package.

```r
msu_to_rap(c("LOC_Os01g01010", "LOC_Os01g01019", "LOC_Os01g01040"))
#> [1] "Os01g0100100" "Os01g0100200" "Os01g0100500"

# optionally restrict the result to identifiers present in another object
msu_to_rap(msu_ids, universe = rownames(obj[["RNA"]]))
```

See the vignette for a full walkthrough:

```r
vignette("vignette", package = "TxDb.Osativa.MSU.RGAP7")
```
