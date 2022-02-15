
# Global theme for all graphs ---------------------------------------------

relt <- 0.9

theme_set(
  theme_minimal() +
    theme(strip.text = element_text(face="italic", size = rel(relt)),
          axis.line = element_line(color = "black", linetype = "solid"),
          axis.text = element_text(colour = "black", size = rel(0.7)),
          axis.title = element_text(colour = "black", size = rel(relt)),
          axis.ticks = element_line(),
          legend.text = element_text(size = rel(relt)),
          legend.title = element_text(size = rel(relt)),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank())
)
