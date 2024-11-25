Racial Disparities and Trends in Endometrial Cancer from 2000-2021
================
Arnetta McVey Moffatt

### Report Overview

This repository contains the data and code needed to render a report on
Endometrial Cancer (EC) trends in SEER data. This analysis uses data
from the SEER\*Stat Database: Incidence - SEER Research Plus Data, 17
Registries, Nov 2023 Sub (2000-2021). Non-Hispanic Black and
Non-Hispanic White women were included if they were diagnosed between
2000 and 2021 with invasive EC.

The report includes Tables 1-3 and Figure 1 which identify population
and biological characteristic of the study population, analysis of EC
death by selected characteristic and trends in EC between 2000 and 2021.

To render the report after downloading the repository, either the
Makefile should be used to generate the figures and final report or each
individual section of code should be run in numerical order (1 through
5).

#### Repository Organization

- `Code directory`: Contains all R script files required for the
  analysis in the final report
- `Data directory`: Stores the data set used in the report
- `Output directory`: Holds all intermediate data generated during the
  analysis
- `Makefile`: Automates the analysis workflow and output generation
  - When Make is installed, running the command Make in the terminal
    will generate the final report and running the command Make clean
    will reset the repository after generating the report

### Requirements

- `Packages`: Includes here, tidyverse, survival, and gtsummary.
  - Missing packages are identified and installed in `01_table_1.R`
- `R`
- `Make`
- `Git` (optional)

### How to Generate Report

1.  Clone the repository via Git or download via zip file
2.  Generate the final report
    1.  In the terminal run ``` Make``Final-Report``.html ```
3.  Remove all files generated when running `Make Final-Report.html`
    1.  In the terminal run `Make clean`
