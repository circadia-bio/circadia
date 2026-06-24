## Tests for ggplot2 scales
library(testthat)
library(ggplot2)

test_that("scale_colour_circadia is a discrete scale", {
  s <- scale_colour_circadia()
  expect_s3_class(s, "ScaleDiscrete")
})

test_that("scale_fill_circadia is a discrete scale", {
  s <- scale_fill_circadia()
  expect_s3_class(s, "ScaleDiscrete")
})

test_that("scale_color_circadia is an alias for scale_colour_circadia", {
  expect_identical(scale_color_circadia, scale_colour_circadia)
})

test_that("scale_fill_circadia_c builds without error", {
  s <- scale_fill_circadia_c("blues")
  expect_s3_class(s, "Scale")
})

test_that("scale_colour_circadia_c builds without error", {
  s <- scale_colour_circadia_c("diverging")
  expect_s3_class(s, "Scale")
})

test_that("theme_circadia returns a theme object", {
  t <- theme_circadia()
  expect_s3_class(t, "theme")
})

test_that("theme_circadia grid argument is respected", {
  expect_no_error(theme_circadia(grid = "none"))
  expect_no_error(theme_circadia(grid = "x"))
  expect_no_error(theme_circadia(grid = "y"))
  expect_error(theme_circadia(grid = "bad"))
})
