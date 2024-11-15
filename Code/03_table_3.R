pacman::p_load(tidyverse, survival, gtsummary)

# Load data
here::i_am("Code/03_table_3.R")
cases_EC <- readRDS(here::here("Data/cleaned_EC_data.RDS"))

# make table 3
table_3 <- coxph(Surv(Survival.months, ECDEATH) ~ Race + age_at_dx + Stage + Grade + Histology_subtype + Chemotherapy.recode..yes..no.unk. + Radiation.recode + surgery_type, 
                data = cases_EC) 
table_3 <- tbl_regression(table_3, exponentiate = TRUE, include = c("Stage", "Grade", "Histology_subtype"), 
                         label = list(Stage ~ "Stage",
                                      Grade ~ "Grade",
                                      Histology_subtype ~ "Histologic Subtype")
) %>% modify_table_styling(column = c(p.value),hide = TRUE)

# save table 3 to be included in the report
saveRDS(table_3, here::here("Output/table_3.rds"))
