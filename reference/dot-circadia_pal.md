# Build a palette function from a Circadia palette

Returns a function that interpolates `n` colours from the named palette.
Used internally by the scale constructors.

## Usage

``` r
.circadia_pal(palette = "main", reverse = FALSE)
```

## Arguments

- palette:

  Palette name passed to
  [`circadia_palette()`](https://github.com/circadia-bio/circadia/reference/circadia_palette.md).

- reverse:

  Logical. Reverse the palette?
