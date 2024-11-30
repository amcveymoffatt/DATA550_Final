# Load packages
pacman::p_load(tidyverse, survival, gtsummary)

# Load data
here::i_am("Code/01_table_1.R")
cases_EC <- readRDS(here::here("Data/cleaned_EC_data.RDS"))

# make table 1
table_1 <- cases_EC %>% select(age_at_dx, ECDEATH, age_at_dx_55, Stage, Grade, Histology_subtype, surgery_type, Chemotherapy.recode..yes..no.unk., Radiation.recode, Rurality, Race, Marital.status.at.diagnosis) %>%
  tbl_summary(by= Race,
              missing_text = "Unknown",
              statistic = list(all_continuous() ~ "{median} ({sd})", all_categorical() ~ "{n} ({p}%)"),
              label = list(age_at_dx ~ "Age at Diagnosis, median (SD), y",
                           ECDEATH ~ "Endometrial Cancer - Specific Deaths, no (%)",
                           age_at_dx_55 ~ "Age, no (%), y",
                           Stage ~ "Stage, no (%)",
                           Grade ~ "Grade , no (%)",
                           Histology_subtype ~ "Histologic Subtype, no (%)",
                           surgery_type ~ "Surgery, no (%)",
                           Chemotherapy.recode..yes..no.unk. ~ "Chemotherapy, no (%)",
                           Radiation.recode ~ "Radiation, no (%)",
                           Marital.status.at.diagnosis ~ "Marital Status, no (%)",
                           Rurality ~ "Rurality, no (%)"
              )
  ) %>% 
  gtsummary::add_overall()


# save table 1 to be included in the report
saveRDS(table_1, here::here("Output/table_1.rds"))
