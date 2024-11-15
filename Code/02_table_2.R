pacman::p_load(tidyverse, survival, gtsummary)

# Load data
here::i_am("Code/02_table_2.R")
cases_EC <- readRDS(here::here("Data/cleaned_EC_data.RDS"))

# make table 2
cases_EC$Race <- relevel(factor(cases_EC$Race), "Non-Hispanic White")

table_2 <- coxph(Surv(Survival.months, ECDEATH) ~ Race + age_at_dx, 
                 data = cases_EC) 
table_2 <- tbl_regression(table_2, exponentiate = TRUE, include = c("Race")) %>% 
  modify_table_styling(column = c(p.value),hide = TRUE)




# save table 2 to be included in the report
saveRDS(table_2, here::here("Output/table_2.rds"))

