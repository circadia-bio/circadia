# 🎨 circadia

**Shared colour palettes, ggplot2 theme, and scales for the Circadia Lab R ecosystem.**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)
[![R](https://img.shields.io/badge/R-%3E%3D4.1-276DC3)](https://www.r-project.org/)
[![R-CMD-check](https://github.com/circadia-bio/circadia/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/circadia-bio/circadia/actions/workflows/R-CMD-check.yaml)

---

## 📖 What is circadia?

`circadia` is the visual identity layer for the Circadia Lab R ecosystem. It
provides a consistent set of brand colours, a clean `ggplot2` theme, and
discrete and continuous scale functions that plug directly into plots produced
by `zeitR`, `slumbR`, `tallieR`, `syncR`, and standalone analysis notebooks.

---

## ✨ Features

- 🎨 **Five named palettes** — `main` (6-colour qualitative), `core` (4-colour
  compact), `diverging` (blue → antique white → coral), `blues` (sequential),
  `warm` (sequential)
- 🔬 **Domain colour map** — `domain_colour_for()` returns the brand colour for
  a named data domain (`"actigraphy"`, `"sleep"`, `"circadian"`,
  `"questionnaire"`, `"demographics"`, `"clinical"`)
- 📊 **Discrete scales** — `scale_colour_circadia()` and
  `scale_fill_circadia()` for categorical data
- 🌈 **Continuous scales** — `scale_colour_circadia_c()` and
  `scale_fill_circadia_c()` with colour interpolation
- 🖼 **`theme_circadia()`** — minimal ggplot2 theme with configurable gridlines,
  Circadia Lab typography, and brand accent colours

---

## 🗂️ Project Structure

```
circadia/
├── R/
│   ├── circadia-package.R   # package-level documentation
│   ├── palettes.R           # palette definitions and retrieval functions
│   ├── scales.R             # ggplot2 discrete and continuous scales
│   └── theme.R              # theme_circadia()
├── tests/
│   └── testthat/
│       ├── test-palettes.R
│       └── test-scales.R
├── vignettes/
│   └── getting-started.Rmd
├── _pkgdown.yml
├── DESCRIPTION
└── LICENSE
```

---

## 🚀 Getting Started

### Installation

```r
# install.packages("remotes")
remotes::install_github("circadia-bio/circadia")
```

### Basic usage

```r
library(circadia)
library(ggplot2)

# Retrieve a palette
circadia_palette("core")
#> deep_blue    coral_red        amber antique_white
#> "#014370"   "#FC544A"   "#FFA75D"   "#FFECD4"

# Domain colour lookup
domain_colour_for("sleep")
#>     sleep
#> "#1B6799"

# Apply theme and scales to a plot
ggplot(mtcars, aes(wt, mpg, colour = factor(cyl))) +
  geom_point(size = 3) +
  scale_colour_circadia() +
  theme_circadia()

# Continuous fill scale with the diverging palette
ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
  geom_tile() +
  scale_fill_circadia_c("warm") +
  theme_circadia(grid = "none")
```

---

## 📦 Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `ggplot2` | ≥ 3.4.0 | Theme and scale infrastructure |

---

## 👥 Authors

| Role | Name | Affiliation |
|------|------|-------------|
| Author, maintainer | Lucas França | Northumbria University |
| Author | Mario Leocadio-Miguel | Northumbria University |

---

## 🤝 Related Tools

- ⏱ [**zeitR**](https://github.com/circadia-bio/zeitR) — wrist actigraphy analysis and circadian metrics
- 😴 [**slumbR**](https://github.com/circadia-bio/slumbR) — sleep diary processing
- 📋 [**tallieR**](https://github.com/circadia-bio/tallieR) — sociodemographic and questionnaire data
- 🔄 [**syncR**](https://github.com/circadia-bio/syncR) — unified participant-indexed database
- 🔬 [**circadia-bio**](https://github.com/circadia-bio) — the Circadia Lab GitHub organisation

---

## 📄 Licence

Released under the [MIT License](./LICENSE).

Copyright © Lucas França, Mario Leocadio-Miguel, 2025
