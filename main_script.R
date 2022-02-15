
# Main script example -----------------------------------------------------

# Erase all outputs (optional)
tables <- paste0("tables/", list.files(path = "tables/"))
figures <- paste0("figures/", list.files(path = "figures/"))
data_products <- paste0("data_products/", list.files(path = "data_products/"))

sapply(c(tables, figures, data_products, "Session_Info.txt"), file.remove)

# Source all R scripts in R folder 
# (Before, it is suggested to restart R by Ctrl + Shift + F10)

r_scripts <- list.files(path = "R/", pattern = "*.R")
r_scripts <- paste0("R/", r_scripts)

sapply(r_scripts, source, .GlobalEnv)

# Session Info
capture.output(sessionInfo(), file = "Session_Info.txt")
