# NEWS for TxDb.Osativa.MSU.RGAP7 Package

## Version 0.99.1

### New features

- Added `msu_to_rap()` to convert MSU/RGAP7 gene identifiers to RAP-DB
  identifiers via the `riceidconverter` package.
- Added `inst/scripts/make-data.R` and `inst/scripts/make-metadata.R`
  documenting how the TxDb resource and its AnnotationHub metadata are built.
- Added unit tests for `msu_to_rap()`.

### Bug fixes

- Removed the leftover `.onLoad()`/`.onUnload()` machinery from `R/zzz.R`. It
  assumed the SQLite database shipped in `inst/extdata`, which is not the case
  for this AnnotationHub-based package.
- `DESCRIPTION` and `NAMESPACE` no longer claim that the TxDb object is created
  and exported when the package is loaded; it is retrieved from AnnotationHub.
- Removed a duplicated `\alias` and two aliases for non-existent objects from
  the package man page.
- The man page example and the vignette no longer fail when AnnotationHub is
  unavailable or the resource cannot be downloaded.

## Version 0.99.0 (2026-08-04)

### Initial Release

- First release of the package.
