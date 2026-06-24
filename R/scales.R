# Circadia Lab ggplot2 scales

# ---- Colour interpolation helper -----------------------------------------

#' Build a palette function from a Circadia palette
#'
#' Returns a function that interpolates `n` colours from the named palette.
#' Used internally by the scale constructors.
#'
#' @param palette Palette name passed to [circadia_palette()].
#' @param reverse Logical. Reverse the palette?
#' @keywords internal
.circadia_pal <- function(palette = "main", reverse = FALSE) {
  pal <- circadia_palette(palette, reverse = reverse)
  function(n) {
    if (n <= length(pal)) {
      unname(pal[seq_len(n)])
    } else {
      # Interpolate for continuous / fine-grained use
      grDevices::colorRampPalette(pal)(n)
    }
  }
}

# ---- Discrete scales -----------------------------------------------------

#' Circadia Lab discrete colour scale
#'
#' Applies a Circadia Lab qualitative palette to the `colour` aesthetic.
#'
#' @param palette Palette name. Default `"main"`.
#' @param reverse Logical. Reverse the palette? Default `FALSE`.
#' @param ... Additional arguments passed to [ggplot2::discrete_scale()].
#'
#' @examples
#' library(ggplot2)
#' ggplot(mtcars, aes(wt, mpg, colour = factor(cyl))) +
#'   geom_point(size = 3) +
#'   scale_colour_circadia() +
#'   theme_circadia()
#'
#' @importFrom ggplot2 discrete_scale
#' @export
scale_colour_circadia <- function(palette = "main", reverse = FALSE, ...) {
  discrete_scale(
    aesthetics = "colour",
    palette    = .circadia_pal(palette, reverse),
    ...
  )
}

#' @rdname scale_colour_circadia
#' @export
scale_color_circadia <- scale_colour_circadia

#' Circadia Lab discrete fill scale
#'
#' Applies a Circadia Lab qualitative palette to the `fill` aesthetic.
#'
#' @inheritParams scale_colour_circadia
#'
#' @examples
#' library(ggplot2)
#' ggplot(mpg, aes(class, fill = drv)) +
#'   geom_bar() +
#'   scale_fill_circadia() +
#'   theme_circadia()
#'
#' @importFrom ggplot2 discrete_scale
#' @export
scale_fill_circadia <- function(palette = "main", reverse = FALSE, ...) {
  discrete_scale(
    aesthetics = "fill",
    palette    = .circadia_pal(palette, reverse),
    ...
  )
}

# ---- Continuous scales ---------------------------------------------------

#' Circadia Lab continuous colour scale
#'
#' Interpolates across a Circadia Lab palette for continuous `colour` data.
#' The `"diverging"` palette is recommended for data centred at zero; `"blues"`
#' or `"warm"` for unipolar data.
#'
#' @param palette Palette name. Default `"blues"`.
#' @param reverse Logical. Reverse the palette? Default `FALSE`.
#' @param ... Additional arguments passed to [ggplot2::scale_colour_gradientn()].
#'
#' @examples
#' library(ggplot2)
#' ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
#'   geom_tile() +
#'   scale_fill_circadia_c("warm") +
#'   theme_circadia()
#'
#' @importFrom ggplot2 scale_colour_gradientn
#' @export
scale_colour_circadia_c <- function(palette = "blues", reverse = FALSE, ...) {
  colours <- unname(circadia_palette(palette, reverse = reverse))
  scale_colour_gradientn(colours = colours, ...)
}

#' @rdname scale_colour_circadia_c
#' @export
scale_color_circadia_c <- scale_colour_circadia_c

#' Circadia Lab continuous fill scale
#'
#' Interpolates across a Circadia Lab palette for continuous `fill` data.
#'
#' @inheritParams scale_colour_circadia_c
#'
#' @importFrom ggplot2 scale_fill_gradientn
#' @export
scale_fill_circadia_c <- function(palette = "blues", reverse = FALSE, ...) {
  colours <- unname(circadia_palette(palette, reverse = reverse))
  scale_fill_gradientn(colours = colours, ...)
}
