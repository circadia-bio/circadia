# Circadia Lab continuous fill scale

Interpolates across a Circadia Lab palette for continuous `fill` data.

## Usage

``` r
scale_fill_circadia_c(palette = "blues", reverse = FALSE, ...)
```

## Arguments

- palette:

  Palette name. Default `"blues"`.

- reverse:

  Logical. Reverse the palette? Default `FALSE`.

- ...:

  Additional arguments passed to
  [`ggplot2::scale_colour_gradientn()`](https://ggplot2.tidyverse.org/reference/scale_gradient.html).
