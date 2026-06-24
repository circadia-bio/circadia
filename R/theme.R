# Circadia Lab ggplot2 theme

#' Circadia Lab ggplot2 theme
#'
#' A clean, minimal ggplot2 theme built on [ggplot2::theme_minimal()] with
#' typography and spacing consistent with Circadia Lab figures.
#'
#' @param base_size Base font size in points. Default `12`.
#' @param base_family Base font family. Default `""` (ggplot2 default).
#' @param grid Which grid lines to show. One of `"xy"` (both, default),
#'   `"x"` (vertical only), `"y"` (horizontal only), `"none"`.
#' @param legend_position Position of the legend passed to
#'   [ggplot2::theme()]. Default `"right"`.
#'
#' @return A [ggplot2::theme()] object.
#'
#' @examples
#' library(ggplot2)
#' ggplot(mtcars, aes(wt, mpg, colour = factor(cyl))) +
#'   geom_point(size = 2) +
#'   scale_colour_circadia() +
#'   theme_circadia()
#'
#' @importFrom ggplot2 theme_minimal theme element_text element_line
#'   element_blank element_rect margin rel unit
#' @export
theme_circadia <- function(
    base_size       = 12,
    base_family     = "",
    grid            = "xy",
    legend_position = "right"
) {
  grid <- match.arg(grid, c("xy", "x", "y", "none"))

  show_x <- grid %in% c("xy", "x")
  show_y <- grid %in% c("xy", "y")

  grid_line <- element_line(colour = "#E8E8E8", linewidth = 0.4)
  no_line   <- element_blank()

  theme_minimal(base_size = base_size, base_family = base_family) +
    theme(
      # --- Text ---
      plot.title    = element_text(
        colour = "#014370", face = "bold",
        size   = rel(1.15), margin = margin(b = 6)
      ),
      plot.subtitle = element_text(
        colour = "#555555",
        size   = rel(0.95), margin = margin(b = 10)
      ),
      plot.caption  = element_text(
        colour = "#888888", size = rel(0.75),
        margin = margin(t = 8), hjust = 1
      ),
      axis.title    = element_text(colour = "#333333", size = rel(0.9)),
      axis.text     = element_text(colour = "#555555", size = rel(0.85)),
      strip.text    = element_text(
        colour = "#014370", face = "bold", size = rel(0.9)
      ),
      legend.title  = element_text(colour = "#333333", size = rel(0.9)),
      legend.text   = element_text(colour = "#555555", size = rel(0.85)),

      # --- Panel ---
      panel.background = element_rect(fill = "white", colour = NA),
      plot.background  = element_rect(fill = "white", colour = NA),
      panel.border     = element_blank(),

      # --- Grid ---
      panel.grid.major.x = if (show_x) grid_line else no_line,
      panel.grid.major.y = if (show_y) grid_line else no_line,
      panel.grid.minor   = no_line,

      # --- Axes ---
      axis.ticks       = element_line(colour = "#CCCCCC", linewidth = 0.3),
      axis.ticks.length = unit(3, "pt"),

      # --- Legend ---
      legend.position  = legend_position,
      legend.key       = element_rect(fill = NA, colour = NA),
      legend.background = element_rect(fill = NA, colour = NA),

      # --- Facets ---
      strip.background = element_rect(fill = "#F0F4F7", colour = NA),

      # --- Spacing ---
      plot.margin = margin(12, 12, 8, 12)
    )
}
