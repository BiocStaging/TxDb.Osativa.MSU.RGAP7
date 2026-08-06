#' Convert MSU (RGAP7) gene identifiers to RAP-DB identifiers
#'
#' Translates a vector of MSU/RGAP7 locus identifiers (e.g. \code{LOC_Os01g01010})
#' into RAP-DB identifiers (e.g. \code{Os01g0100100}) using
#' \code{riceidconverter::RiceIDConvert()}. The input order is preserved and
#' identifiers that cannot be converted are dropped.
#'
#' @param msu_ids Character vector of MSU/RGAP7 gene identifiers.
#' @param universe Optional character vector of allowed RAP-DB identifiers
#'   (for example \code{rownames(obj[["RNA"]])} of a Seurat object). When
#'   supplied, the result is restricted to identifiers present in
#'   \code{universe}, keeping the order of \code{msu_ids}.
#' @param unique Logical; if \code{TRUE} (default) duplicated RAP-DB
#'   identifiers are removed.
#'
#' @return A character vector of RAP-DB identifiers, in the order of
#'   \code{msu_ids}.
#'
#' @note Requires the \pkg{riceidconverter} package.
#'
#' @examples
#' msu_ids <- c("LOC_Os01g01010", "LOC_Os01g01019", "LOC_Os01g01040")
#'
#' if (requireNamespace("riceidconverter", quietly=TRUE)) {
#'     ## MSU -> RAP-DB, input order preserved
#'     rap_ids <- msu_to_rap(msu_ids)
#'     rap_ids
#'
#'     ## restrict the result to identifiers present in another object,
#'     ## e.g. rownames(obj[["RNA"]]) of a Seurat object
#'     msu_to_rap(msu_ids, universe=rap_ids[1])
#' }
#'
#' @export
msu_to_rap <- function(msu_ids, universe = NULL, unique = TRUE)
{
  if (!is.character(msu_ids))
    stop("'msu_ids' must be a character vector")
  if (!requireNamespace("riceidconverter", quietly=TRUE))
    stop("package 'riceidconverter' is required for msu_to_rap(); ",
         "install it with install.packages(\"riceidconverter\")")
  if (!is.null(universe) && !is.character(universe))
    stop("'universe' must be a character vector or NULL")

  converted <- riceidconverter::RiceIDConvert(msu_ids,
                                              fromType="MSU",
                                              toType="RAP")
  rap_lookup <- stats::setNames(as.character(converted$RAP),
                                as.character(converted$MSU))
  rap_ids <- unname(rap_lookup[msu_ids])
  rap_ids <- rap_ids[!is.na(rap_ids) & nzchar(rap_ids) & rap_ids != "None"]
  if (unique)
    rap_ids <- base::unique(rap_ids)
  if (!is.null(universe))
    rap_ids <- rap_ids[rap_ids %in% universe]
  rap_ids
}
