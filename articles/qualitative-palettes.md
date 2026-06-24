# Qualitative palettes

``` r

library(circadia)
library(ggplot2)
```

The qualitative palettes are designed for **categorical data** where
each colour encodes a distinct group. circadia provides two: `main` (8
colours) for complex figures, and `core` (5 colours) as a compact
everyday subset.

## The `main` palette

Eight brand colours spanning the full chromatic range — use when you
have up to 8 categorical groups.

deep blue \#014370

coral red \#FC544A

amber \#FFA75D

ochre \#C8860A

antique white \#FFECD4

mid blue \#1B6799

steel blue \#4A9BBF

pale teal \#9BDFE2

*Click any swatch to copy the hex code.*

``` r

ggplot(mtcars, aes(wt, mpg, colour = factor(cyl))) +
  geom_point(size = 3, alpha = 0.85) +
  labs(
    title   = "Fuel efficiency by engine size",
    colour  = "Cylinders",
    x       = "Weight (1000 lbs)",
    y       = "Miles per gallon"
  ) +
  scale_colour_circadia() +
  theme_circadia()
```

![Scatter plot of car weight vs mpg coloured by cylinder count using the
main palette](qualitative-palettes_files/figure-html/main-scatter-1.png)

``` r

ggplot(mpg, aes(class, fill = drv)) +
  geom_bar(position = "dodge") +
  labs(
    title = "Vehicle classes by drive type",
    fill  = "Drive",
    x     = NULL, y = "Count"
  ) +
  scale_fill_circadia() +
  theme_circadia(grid = "y")
```

![Grouped bar chart of vehicle classes by drive type using the main
palette](qualitative-palettes_files/figure-html/main-bar-1.png)

## The `core` palette

A compact 5-colour subset — the four anchors plus ochre. Use this for
figures with five or fewer groups where you want the cleanest possible
colour separation.

deep blue \#014370

coral red \#FC544A

amber \#FFA75D

ochre \#C8860A

antique white \#FFECD4

``` r

ggplot(mpg, aes(displ, hwy, colour = drv)) +
  geom_point(size = 2.5, alpha = 0.8) +
  labs(
    title  = "Engine displacement vs highway mpg",
    colour = "Drive type",
    x      = "Displacement (L)", y = "Highway mpg"
  ) +
  scale_colour_circadia(palette = "core") +
  theme_circadia()
```

![Scatter plot coloured by drive type using the core
palette](qualitative-palettes_files/figure-html/core-scatter-1.png)

## Reversing the palette

Pass `reverse = TRUE` to flip the colour order — useful when you want
the lightest colour to map to the first factor level.

``` r

ggplot(mtcars, aes(factor(cyl), mpg, fill = factor(cyl))) +
  geom_boxplot(alpha = 0.85, show.legend = FALSE) +
  labs(
    title = "MPG distribution by cylinders — reversed palette",
    x     = "Cylinders", y = "Miles per gallon"
  ) +
  scale_fill_circadia(palette = "core", reverse = TRUE) +
  theme_circadia(grid = "y")
```

![Box plots of mpg by cylinder count with reversed
palette](qualitative-palettes_files/figure-html/reverse-1.png)

## Retrieving colours directly

Use
[`circadia_palette()`](https://github.com/circadia-bio/circadia/reference/circadia_palette.md)
when you need the raw hex values — for example, to pass to
[`ggplot2::scale_colour_manual()`](https://ggplot2.tidyverse.org/reference/scale_manual.html)
or base R graphics.

``` r

# Full main palette
circadia_palette("main")
#>     deep_blue     coral_red         amber         ochre antique_white 
#>     "#014370"     "#FC544A"     "#FFA75D"     "#C8860A"     "#FFECD4" 
#>      mid_blue    steel_blue     pale_teal 
#>     "#1B6799"     "#4A9BBF"     "#9BDFE2"

# First three colours from core
circadia_palette("core", n = 3)
#> deep_blue coral_red     amber 
#> "#014370" "#FC544A" "#FFA75D"

# Reversed blues
circadia_palette("core", reverse = TRUE)
#> antique_white         ochre         amber     coral_red     deep_blue 
#>     "#FFECD4"     "#C8860A"     "#FFA75D"     "#FC544A"     "#014370"
```
