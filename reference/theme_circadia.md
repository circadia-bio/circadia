# Circadia Lab ggplot2 theme

A clean, minimal ggplot2 theme built on
[`ggplot2::theme_minimal()`](https://ggplot2.tidyverse.org/reference/ggtheme.html)
with typography and spacing consistent with Circadia Lab figures.

## Usage

``` r
theme_circadia(
  base_size = 12,
  base_family = "",
  grid = "xy",
  legend_position = "right"
)
```

## Arguments

- base_size:

  Base font size in points. Default `12`.

- base_family:

  Base font family. Default `""` (ggplot2 default).

- grid:

  Which grid lines to show. One of `"xy"` (both, default), `"x"`
  (vertical only), `"y"` (horizontal only), `"none"`.

- legend_position:

  Position of the legend passed to
  [`ggplot2::theme()`](https://ggplot2.tidyverse.org/reference/theme.html).
  Default `"right"`.

## Value

A
[`ggplot2::theme()`](https://ggplot2.tidyverse.org/reference/theme.html)
object.

## Examples

``` r
library(ggplot2)
ggplot(mtcars, aes(wt, mpg, colour = factor(cyl))) +
  geom_point(size = 2) +
  scale_colour_circadia() +
  theme_circadia()

```
