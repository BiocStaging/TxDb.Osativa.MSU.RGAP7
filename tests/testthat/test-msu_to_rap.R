test_that("msu_to_rap() validates its arguments", {
    expect_error(msu_to_rap(123), "must be a character vector")
    expect_error(msu_to_rap("LOC_Os01g01010", universe=1), "'universe'")
})

test_that("msu_to_rap() converts MSU identifiers and preserves order", {
    skip_if_not_installed("riceidconverter")

    msu_ids <- c("LOC_Os01g01010", "LOC_Os01g01019", "LOC_Os01g01040")
    expect_identical(msu_to_rap(msu_ids),
                     c("Os01g0100100", "Os01g0100200", "Os01g0100500"))
})

test_that("msu_to_rap() drops unconvertible identifiers", {
    skip_if_not_installed("riceidconverter")

    msu_ids <- c("LOC_Os01g01010", "LOC_Os99g99999")
    expect_identical(msu_to_rap(msu_ids), "Os01g0100100")
})

test_that("msu_to_rap() restricts the result to 'universe'", {
    skip_if_not_installed("riceidconverter")

    msu_ids <- c("LOC_Os01g01010", "LOC_Os01g01019")
    expect_identical(msu_to_rap(msu_ids, universe="Os01g0100200"),
                     "Os01g0100200")
    expect_identical(msu_to_rap(msu_ids, universe=character(0)),
                     character(0))
})

test_that("msu_to_rap() honours 'dedup'", {
    skip_if_not_installed("riceidconverter")

    msu_ids <- c("LOC_Os01g01010", "LOC_Os01g01010")
    expect_identical(msu_to_rap(msu_ids), "Os01g0100100")
    expect_identical(msu_to_rap(msu_ids, dedup=FALSE),
                     c("Os01g0100100", "Os01g0100100"))
})
