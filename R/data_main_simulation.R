
# Data simulation ---------------------------------------------------------

# Treatments
treatments <- rep(1:3, each = 10)

# Response values for each treatment
set.seed(1)

treatment_1 <- rnorm(10, 15, sd = 2)
treatment_2 <- rnorm(10, 10, sd = 0.5)
treatment_3 <- rnorm(10, 21, sd = 1.2)

# Data frame with treatments and response values
data_main <- data.frame(
  Treatment = treatments,
  Resp  = round(c(treatment_1, treatment_2, treatment_3), 3)
)

# Export data
write.csv(data_main, "data/data_main.csv", row.names = FALSE)

# Treatment and response information
var <- c("Resp", "Treatment 1", "Treatment 2", "Treatment 3")

resp_desc <- "Some response mesaured by some method in certain units"
treat1_desc <- "Control group"
treat2_desc <- "Drug 1"
treat3_desc <- "Drug 2"

data_info <- data.frame(
  Variable = var,
  Description = c(resp_desc, treat1_desc, treat2_desc, treat3_desc)
)

# Export data infor
write.csv(data_info, "data/data_info.csv", row.names = FALSE)
