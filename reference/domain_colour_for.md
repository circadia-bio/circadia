# Return the brand colour for a Circadia Lab data domain

Looks up the hex colour associated with a named data domain. Useful when
you want to colour-code panels or annotations by data type rather than
by group membership.

## Usage

``` r
domain_colour_for(domain)
```

## Arguments

- domain:

  Character scalar. One of `"actigraphy"`, `"sleep"`, `"circadian"`,
  `"questionnaire"`, `"demographics"`, `"clinical"`, `"light"`,
  `"activity"`.

## Value

A length-1 named character vector with the domain hex colour, e.g.
`c(actigraphy = "#014370")`.

## Examples

``` r
domain_colour_for("sleep")
#>     sleep 
#> "#1B6799" 
domain_colour_for("light")
#>     light 
#> "#C8860A" 
domain_colour_for("activity")
#>  activity 
#> "#4A9BBF" 
```
