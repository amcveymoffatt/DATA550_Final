library(tidyverse)

here::i_am("Code/04_figure_1.R")
cases_EC <- readRDS(here::here("Data/cleaned_EC_data.RDS"))


cases_by_year <- cases_EC %>%
  group_by(Year.of.diagnosis) %>%
  summarise(count = n())

# make figure 1
figure_1 <- ggplot(cases_by_year, aes(x = Year.of.diagnosis, y = count)) +
  geom_line() +
  labs(
    title = "Cases of Endometrial Cancer in the SEER*STAT Database by Year",
    x = "Year of Diagnosis",
    y = "Number of Cases"
  )  +
  theme_minimal() 

# save figure 1 to be included in the report
saveRDS(figure_1, here::here("Output/figure_1.rds"))
