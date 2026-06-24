# Retrieve a Circadia Lab palette

Returns a named character vector of hex colour codes for the requested
palette. Suitable for direct use in
[`ggplot2::scale_fill_manual()`](https://ggplot2.tidyverse.org/reference/scale_manual.html)
or
[`ggplot2::scale_colour_manual()`](https://ggplot2.tidyverse.org/reference/scale_manual.html).

## Usage

``` r
circadia_palette(palette = "main", n = NULL, reverse = FALSE)
```

## Arguments

- palette:

  Name of the palette. One of `"main"`, `"core"`, `"diverging"`,
  `"diverging_simple"`, `"blues"`, `"warm"`, `"seq_blue"`,
  `"seq_coral"`, `"seq_amber"`, `"seq_ochre"`. Defaults to `"main"`.

- n:

  Number of colours to return. If `NULL` (default) all colours in the
  palette are returned. If `n` is smaller than the palette length the
  first `n` colours are returned; if larger an error is thrown.

- reverse:

  Logical. Reverse the order of the palette? Default `FALSE`.

## Value

A named (or unnamed for gradient palettes) character vector of hex
colour codes.

## Details

Gradient palettes come in two families:

- **Complex** (multi-hue): `"diverging"`, `"blues"`, `"warm"`

- **Simple** (monochromatic / direct interpolation):
  `"diverging_simple"`, `"seq_blue"`, `"seq_coral"`, `"seq_amber"`,
  `"seq_ochre"`

## Examples

``` r
circadia_palette()
#>     deep_blue     coral_red         amber         ochre antique_white 
#>     "#014370"     "#FC544A"     "#FFA75D"     "#C8860A"     "#FFECD4" 
#>      mid_blue    steel_blue     pale_teal 
#>     "#1B6799"     "#4A9BBF"     "#9BDFE2" 
circadia_palette("core")
#>     deep_blue     coral_red         amber         ochre antique_white 
#>     "#014370"     "#FC544A"     "#FFA75D"     "#C8860A"     "#FFECD4" 
circadia_palette("diverging_simple")
#> [1] "#014370" "#567B91" "#AAB4B3" "#FFECD4" "#FEB9A6" "#FD8778" "#FC544A"
circadia_palette("seq_blue", n = 3)
#> [1] "#D4E5EF" "#8FBDD5" "#4A95BB"
circadia_palette("diverging", reverse = TRUE)
#> [1] "#FC544A" "#FC7060" "#FFA75D" "#FFC99A" "#FFECD4" "#9BDFE2" "#4A9BBF"
#> [8] "#1B6799" "#014370"
```
