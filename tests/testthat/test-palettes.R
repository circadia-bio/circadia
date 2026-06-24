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

test_that("domain_colour_for returns a named hex colour", {
  col <- domain_colour_for("sleep")
  expect_type(col, "character")
  expect_length(col, 1L)
  expect_named(col, "sleep")
  expect_match(col, "^#[0-9A-Fa-f]{6}$")
})

test_that("domain_colour_for errors for unknown domain", {
  expect_error(domain_colour_for("invalid"), "Unknown domain")
})

test_that("circadia_palettes returns a named integer vector invisibly", {
  out <- expect_invisible(circadia_palettes())
  expect_type(out, "integer")
  expect_true("main" %in% names(out))
})
