## Tests for palette functions
library(testthat)

test_that("circadia_palette returns the main palette by default", {
  pal <- circadia_palette()
  expect_type(pal, "character")
  expect_length(pal, 8L)
  expect_true(all(grepl("^#[0-9A-Fa-f]{6}$", pal)))
})

test_that("circadia_palette respects n argument", {
  pal <- circadia_palette("main", n = 3)
  expect_length(pal, 3L)
})

test_that("circadia_palette errors when n > palette length", {
  expect_error(circadia_palette("core", n = 10), "only 5 colours")
})

test_that("circadia_palette errors for unknown palette", {
  expect_error(circadia_palette("nope"), "Unknown palette")
})

test_that("circadia_palette reverses correctly", {
  fwd <- circadia_palette("core")
  rev_pal <- circadia_palette("core", reverse = TRUE)
  expect_equal(rev_pal, rev(fwd))
})

test_that("diverging_simple is present and has 7 stops", {
  pal <- circadia_palette("diverging_simple")
  expect_length(pal, 7L)
  expect_equal(pal[[1]], "#014370")
  expect_equal(pal[[7]], "#FC544A")
})

test_that("simple sequential palettes exist and have 5 stops each", {
  for (nm in c("seq_blue", "seq_coral", "seq_amber", "seq_ochre")) {
    pal <- circadia_palette(nm)
    expect_length(pal, 5L, label = nm)
    expect_true(all(grepl("^#[0-9A-Fa-f]{6}$", pal)), label = nm)
  }
})

test_that("domain_colour_for returns a named hex colour", {
  col <- domain_colour_for("sleep")
  expect_type(col, "character")
  expect_length(col, 1L)
  expect_named(col, "sleep")
  expect_match(col, "^#[0-9A-Fa-f]{6}$")
})

test_that("domain_colour_for works for new domains", {
  expect_match(domain_colour_for("light"),    "^#[0-9A-Fa-f]{6}$")
  expect_match(domain_colour_for("activity"), "^#[0-9A-Fa-f]{6}$")
  expect_named(domain_colour_for("light"),    "light")
  expect_named(domain_colour_for("activity"), "activity")
})

test_that("domain_colour_for errors for unknown domain", {
  expect_error(domain_colour_for("invalid"), "Unknown domain")
})

test_that("circadia_palettes returns a named integer vector invisibly", {
  out <- expect_invisible(circadia_palettes())
  expect_type(out, "integer")
  expect_true("main" %in% names(out))
  expect_true("diverging_simple" %in% names(out))
  expect_true("seq_ochre" %in% names(out))
})
