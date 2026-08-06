# NEWS for TxDb.Osativa.MSU.RGAP7 Package

## Version 0.99.0 (2026-08-04)

### Initial Release

- First release of the package.
- The TxDb resource is distributed through AnnotationHub rather than shipped
  inside the package; it is retrieved at runtime with `AnnotationHub()`.
- Added `msu_to_rap()` to convert MSU/RGAP7 gene identifiers to RAP-DB
  identifiers via the `riceidconverter` package.
- Added `inst/scripts/make-data.R` and `inst/scripts/make-metadata.R`
  documenting how the TxDb resource and its AnnotationHub metadata are built.
- Added unit tests for `msu_to_rap()`.
