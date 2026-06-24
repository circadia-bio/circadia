# List all available Circadia Lab palettes

Prints the names and sizes of all palettes defined in the package.

## Usage

``` r
circadia_palettes()
```

## Value

A named integer vector of palette lengths, invisibly.

## Examples

``` r
circadia_palettes()
#> Available circadia palettes:
#>   Qualitative:
#>     main                  8 colours
#>     core                  5 colours
#>   Diverging:
#>     diverging             9 colours
#>     diverging_simple      7 colours
#>   Sequential (complex):
#>     blues                 6 colours
#>     warm                  5 colours
#>   Sequential (simple):
#>     seq_blue              5 colours
#>     seq_coral             5 colours
#>     seq_amber             5 colours
#>     seq_ochre             5 colours
```
