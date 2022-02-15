
# Code for table 1 -------------------------------------------

library(readr)
library(dplyr)
library(agricolae)

# Import data
data_main <- read_csv("data/data_main.csv")

# Statistical analysis -----------------------------------------------

# Treatments as factors
data_main_c <- mutate(data_main, Treatment = as.factor(Treatment))

# ANOVA
data_aov <- aov(Resp ~ Treatment, data_main_c)
data_anova <- anova(data_aov)

write.csv(data_anova, "data_products/ANOVA_Treatments.csv", na = "")

# HSD Tukey Test
data_hsd   <- HSD.test(data_aov, "Treatment")
hsd_groups <- data_hsd$groups 

capture.output(data_hsd, file = "data_products/HSD_results.txt")
write.csv(hsd_groups, "data_products/HSD_groups.csv", row.names = FALSE)


# Table 1 -----------------------------------------------------------------

# Data summary with group means and standard deviations 
data_summary <- data_main %>% 
  group_by(Treatment) %>% 
  summarise(
    TreatmentMean = mean(Resp),
    TreatmentSD   = sd(Resp),
    TreatmentCV   = TreatmentSD * 100 / TreatmentMean
  ) %>% 
  round(digits = 1)

# Table 1 in a usual form with means ± SD 
table_1 <- data_summary %>% 
  arrange(desc(TreatmentMean)) %>% 
  mutate(Response = paste(TreatmentMean, "±", TreatmentSD, hsd_groups$groups)) %>% 
  select(Treatment, Response) %>% 
  arrange(Treatment)

write.csv(table_1, "tables/table_1.csv", row.names = FALSE)
