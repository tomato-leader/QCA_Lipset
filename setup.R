# Run this once to initialize renv and install packages
# Usage: Rscript setup.R

if (!requireNamespace("renv", quietly = TRUE)) install.packages("renv")

renv::init(bare = TRUE)

pkgs <- c(
  "QCA",        # fuzzy-QCA
  "ggplot2",    # visualization
  "dplyr",      # data wrangling
  "tidyr",      # reshaping
  "knitr",      # Quarto integration
  "kableExtra", # formatted tables
  "ggrepel",    # label placement
  "patchwork"   # plot composition
)

renv::install(pkgs)
renv::snapshot()

message("Setup complete. Run `quarto render analysis.qmd` to build the report.")
