# Circadia Lab colour palettes
#
# Palette definitions and helper functions for retrieving colours.
#
# Gradient palette families:
#   Complex  — multi-hue gradations: `diverging`, `blues`, `warm`
#   Simple   — single-axis interpolations: `diverging_simple`,
#              `seq_blue`, `seq_coral`, `seq_amber`, `seq_ochre`

#' Circadia Lab colour palettes
#'
#' Named list of all palettes available in the circadia package.
#'
#' @format A named list of character vectors, each containing hex colour codes.
#' @keywords internal
.circadia_palettes <- list(

  # ---- Qualitative -------------------------------------------------------
  # Eight brand colours in order of visual weight; suitable for categorical data.
  main = c(
    deep_blue     = "#014370",
    coral_red     = "#FC544A",
    amber         = "#FFA75D",
    ochre         = "#C8860A",
    antique_white = "#FFECD4",
    mid_blue      = "#1B6799",
    steel_blue    = "#4A9BBF",
    pale_teal     = "#9BDFE2"
  ),

  # Compact 5-colour subset (most frequently used in figures)
  core = c(
    deep_blue     = "#014370",
    coral_red     = "#FC544A",
    amber         = "#FFA75D",
    ochre         = "#C8860A",
    antique_white = "#FFECD4"
  ),

  # ---- Diverging (complex) -----------------------------------------------
  # Multi-hue: deep blue -> teal -> antique white -> amber -> coral.
  # Maximises perceptual distance across the full range.
  diverging = c(
    "#014370", "#1B6799", "#4A9BBF", "#9BDFE2",
    "#FFECD4",
    "#FFC99A", "#FFA75D", "#FC7060", "#FC544A"
  ),

  # ---- Diverging (simple) ------------------------------------------------
  # Single-axis: deep blue -> antique white -> coral.
  # Direct interpolation; lower chromatic contrast, cleaner at small sizes.
  diverging_simple = c(
    "#014370", "#567B91", "#AAB4B3", "#FFECD4", "#FEB9A6", "#FD8778", "#FC544A"
  ),

  # ---- Sequential (complex) ----------------------------------------------
  # Multi-hue blue family: deep blue -> pale teal.
  blues = c(
    "#014370", "#1B6799", "#4A9BBF", "#7FB5C8", "#9BDFE2", "#D4F3F5"
  ),

  # Multi-hue warm family: coral -> antique white.
  warm = c(
    "#FC544A", "#FC7060", "#FFA75D", "#FFC99A", "#FFECD4"
  ),

  # ---- Sequential (simple) -----------------------------------------------
  # Monochromatic shades of each core brand colour, light -> saturated.
  seq_blue = c(
    "#D4E5EF", "#8FBDD5", "#4A95BB", "#1B6799", "#014370"
  ),

  seq_coral = c(
    "#FDECE8", "#F9B5AD", "#F57E73", "#F54840", "#C22420"
  ),

  seq_amber = c(
    "#FFF0E2", "#FFC87A", "#FFA016", "#D97A00", "#A85E00"
  ),

  seq_ochre = c(
    "#F5E8C0", "#E0BB6A", "#C8860A", "#9A6508", "#6C4606"
  )
)

# ---- Domain colour map ---------------------------------------------------

#' Domain colour map
#'
#' Associates each data domain in the Circadia Lab ecosystem with a brand
#' colour. Consumed internally by [domain_colour_for()].
#'
#' @keywords internal
.circadia_domain_info <- list(
  actigraphy    = list(colour = "#014370", label = "Actigraphy"),
  sleep         = list(colour = "#1B6799", label = "Sleep"),
  circadian     = list(colour = "#9BDFE2", label = "Circadian rhythm"),
  questionnaire = list(colour = "#FFA75D", label = "Questionnaire"),
  demographics  = list(colour = "#FFECD4", label = "Demographics"),
  clinical      = list(colour = "#FC544A", label = "Clinical"),
  light         = list(colour = "#C8860A", label = "Light exposure"),
  activity      = list(colour = "#4A9BBF", label = "Activity")
)

# ---- Public functions ----------------------------------------------------

#' Retrieve a Circadia Lab palette
#'
#' Returns a named character vector of hex colour codes for the requested
#' palette. Suitable for direct use in [ggplot2::scale_fill_manual()] or
#' [ggplot2::scale_colour_manual()].
#'
#' Gradient palettes come in two families:
#' * **Complex** (multi-hue): `"diverging"`, `"blues"`, `"warm"`
#' * **Simple** (monochromatic / direct interpolation): `"diverging_simple"`,
#'   `"seq_blue"`, `"seq_coral"`, `"seq_amber"`, `"seq_ochre"`
#'
#' @param palette Name of the palette. One of `"main"`, `"core"`,
#'   `"diverging"`, `"diverging_simple"`, `"blues"`, `"warm"`,
#'   `"seq_blue"`, `"seq_coral"`, `"seq_amber"`, `"seq_ochre"`.
#'   Defaults to `"main"`.
#' @param n Number of colours to return. If `NULL` (default) all colours in
#'   the palette are returned. If `n` is smaller than the palette length the
#'   first `n` colours are returned; if larger an error is thrown.
#' @param reverse Logical. Reverse the order of the palette? Default `FALSE`.
#'
#' @return A named (or unnamed for gradient palettes) character vector of
#'   hex colour codes.
#'
#' @examples
#' circadia_palette()
#' circadia_palette("core")
#' circadia_palette("diverging_simple")
#' circadia_palette("seq_blue", n = 3)
#' circadia_palette("diverging", reverse = TRUE)
#'
#' @export
circadia_palette <- function(palette = "main", n = NULL, reverse = FALSE) {
  pal <- .circadia_palettes[[palette]]
  if (is.null(pal)) {
    stop(
      sprintf(
        "Unknown palette '%s'. Choose from: %s.",
        palette,
        paste(names(.circadia_palettes), collapse = ", ")
      ),
      call. = FALSE
    )
  }

  if (!is.null(n)) {
    if (n > length(pal)) {
      stop(
        sprintf(
          "Palette '%s' has only %d colours; %d requested.",
          palette, length(pal), n
        ),
        call. = FALSE
      )
    }
    pal <- pal[seq_len(n)]
  }

  if (reverse) pal <- rev(pal)
  pal
}

#' Return the brand colour for a Circadia Lab data domain
#'
#' Looks up the hex colour associated with a named data domain. Useful when
#' you want to colour-code panels or annotations by data type rather than by
#' group membership.
#'
#' @param domain Character scalar. One of `"actigraphy"`, `"sleep"`,
#'   `"circadian"`, `"questionnaire"`, `"demographics"`, `"clinical"`,
#'   `"light"`, `"activity"`.
#'
#' @return A length-1 named character vector with the domain hex colour, e.g.
#'   `c(actigraphy = "#014370")`.
#'
#' @examples
#' domain_colour_for("sleep")
#' domain_colour_for("light")
#' domain_colour_for("activity")
#'
#' @export
domain_colour_for <- function(domain) {
  info <- .circadia_domain_info[[domain]]
  if (is.null(info)) {
    stop(
      sprintf(
        "Unknown domain '%s'. Choose from: %s.",
        domain,
        paste(names(.circadia_domain_info), collapse = ", ")
      ),
      call. = FALSE
    )
  }
  col <- info$colour
  names(col) <- domain
  col
}

#' List all available Circadia Lab palettes
#'
#' Prints the names and sizes of all palettes defined in the package.
#'
#' @return A named integer vector of palette lengths, invisibly.
#'
#' @examples
#' circadia_palettes()
#'
#' @export
circadia_palettes <- function() {
  sizes <- lengths(.circadia_palettes)
  cat("Available circadia palettes:\n")
  cat("  Qualitative:\n")
  for (nm in c("main", "core")) {
    cat(sprintf("    %-20s  %d colours\n", nm, sizes[[nm]]))
  }
  cat("  Diverging:\n")
  for (nm in c("diverging", "diverging_simple")) {
    cat(sprintf("    %-20s  %d colours\n", nm, sizes[[nm]]))
  }
  cat("  Sequential (complex):\n")
  for (nm in c("blues", "warm")) {
    cat(sprintf("    %-20s  %d colours\n", nm, sizes[[nm]]))
  }
  cat("  Sequential (simple):\n")
  for (nm in c("seq_blue", "seq_coral", "seq_amber", "seq_ochre")) {
    cat(sprintf("    %-20s  %d colours\n", nm, sizes[[nm]]))
  }
  invisible(sizes)
}
