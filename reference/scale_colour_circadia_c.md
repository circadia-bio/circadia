# Circadia Lab continuous colour scale

Interpolates across a Circadia Lab palette for continuous `colour` data.
The `"diverging"` palette is recommended for data centred at zero;
`"blues"` or `"warm"` for unipolar data.

## Usage

``` r
scale_colour_circadia_c(palette = "blues", reverse = FALSE, ...)

scale_color_circadia_c(palette = "blues", reverse = FALSE, ...)
```

## Arguments

- palette:

  Palette name. Default `"blues"`.

- reverse:

  Logical. Reverse the palette? Default `FALSE`.

- ...:

  Additional arguments passed to
  [`ggplot2::scale_colour_gradientn()`](https://ggplot2.tidyverse.org/reference/scale_gradient.html).

## Examples

``` r
library(ggplot2)
ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
  geom_tile() +
  scale_fill_circadia_c("warm") +
  theme_circadia()

```
