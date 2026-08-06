# zzz.R

datacache <- new.env(hash = TRUE, parent = emptyenv())

TxDb.Osativa.MSU.RGAP7conn <- function() {
  AnnotationDbi::dbconn(datacache)
}

TxDb.Osativa.MSU.RGAP7file <- function() {
  AnnotationDbi::dbfile(datacache)
}

TxDb.Osativa.MSU.RGAP7schema <- function(file = "", show.indices = FALSE) {
  AnnotationDbi::dbschema(datacache, file = file, show.indices = show.indices)
}

TxDb.Osativa.MSU.RGAP7Info <- function() {
  AnnotationDbi::dbInfo(datacache)
}

TxDb.Osativa.MSU.RGAP7ORGANISM <- "Oryza sativa"

.onLoad <- function(libname, pkgname) {
  # Do nothing — database will be loaded from AnnotationHub
  invisible()
}

.onUnload <- function(libpath) {
  # Optional: clean up dbconn if used in manual mode
  if (exists("dbconn", envir = datacache)) {
    conn <- get("dbconn", envir = datacache)
    if (RSQLite::dbIsValid(conn)) RSQLite::dbDisconnect(conn)
  }
}

