\name{TxDb.Osativa.MSU.RGAP7}
\docType{package}

\alias{TxDb.Osativa.MSU.RGAP7-package}
\alias{TxDb.Osativa.MSU.RGAP7}
\alias{TxDb.Osativa.MSU.RGAP7}
\alias{TxDb.Osativa.MSU.RGAP7_dbconn}
\alias{TxDb.Osativa.MSU.RGAP7_dbfile}

\title{Annotation package for TxDb object(s)}

\description{
  This package loads a TxDb object for \emph{Oryza sativa} based on the
  Rice Genome Annotation Project (RGAP) Release 7 annotation (MSU7).
  The TxDb object provides transcript, exon, CDS and gene ranges
  for the IRGSP-1.0 / MSU7 genome assembly.
}

\note{
  This data package was built from the RGAP Release 7 GFF3 annotation
  (MSU7, IRGSP-1.0).
}

\author{
  Dwijesh Chandra Mishra (aut),
  Kabilan S (aut, cre) \email{kabilan151414@gmail.com}
}

\seealso{
  \link[GenomicFeatures]{transcripts},
  \link[GenomicFeatures]{transcriptsBy}
}

\examples{
## load the library
library(TxDb.Osativa.MSU.RGAP7)

## list the contents that are loaded into memory
ls('package:TxDb.Osativa.MSU.RGAP7')

## show the db object that is loaded by calling its name
TxDb.Osativa.MSU.RGAP7

## retrieve all genes
genes(TxDb.Osativa.MSU.RGAP7)
}

\keyword{package}
\keyword{data}
