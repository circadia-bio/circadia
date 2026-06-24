# Circadia Lab discrete colour scale

Applies a Circadia Lab qualitative palette to the `colour` aesthetic.

## Usage

``` r
scale_colour_circadia(palette = "main", reverse = FALSE, ...)

scale_color_circadia(palette = "main", reverse = FALSE, ...)
```

## Arguments

- palette:

  Palette name. Default `"main"`.

- reverse:

  Logical. Reverse the palette? Default `FALSE`.

- ...:

  Additional arguments passed to
  [`ggplot2::discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html).

## Examples

``` r
library(ggplot2)
ggplot(mtcars, aes(wt, mpg, colour = factor(cyl))) +
  geom_point(size = 3) +
  scale_colour_circadia() +
  theme_circadia()

```
