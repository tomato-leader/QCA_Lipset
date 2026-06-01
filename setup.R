# Run this once to initialize renv and install packages
# Usage: Rscript setup.R

options(repos = c(CRAN = "https://cloud.r-project.org"))

if (!requireNamespace("renv", quietly = TRUE)) install.packages("renv")

renv::init(bare = TRUE)

pkgs <- c(
  "QCA",       # fuzzy-QCA
  "ggplot2",   # visualization
  "dplyr",     # data wrangling
  "tidyr",     # reshaping
  "knitr",     # Quarto integration
  "rmarkdown", # required by Quarto R engine
  "ggrepel",   # label placement
  "patchwork", # plot composition
  "IRkernel"   # R kernel for Jupyter / quarto convert
)

# Jupyter カーネルとして R を登録（ipynb 変換時に必要）
IRkernel::installspec(user = TRUE)

renv::install(pkgs)
renv::snapshot()

message("Setup complete. Run `quarto render analysis.qmd` to build the report.")
