
# Code for Figure 1 -------------------------------------------------------

library(readr)
library(ggplot2)

# Set global theme 
source("R/global_theme.R")

# Data import
data_main <- read_csv("data/data_main.csv")

# Figure 1
figure_1 <- ggplot(data_main, aes(as.factor(Treatment), Resp)) +
  geom_boxplot(outlier.shape = 0, outlier.color = "red", outlier.size = 3) +
  geom_point(aes(color = as.factor(Treatment)),show.legend = FALSE) +
  xlab("Treatment") +
  ylab("Reponse") 

# Export a JPEG 
ggsave(
  filename = "figures/figure_1.jpeg", plot = figure_1, units = "cm",
  width = 12, height = 10, dpi = 400
)
