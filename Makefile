# Code/05_render_report.R: generate the final report
Final-Report.html: Code/05_render_report.R Output/table_1.rds \
Output/table_2.rds Output/table_3.rds Output/figure_1.rds install
	Rscript Code/05_render_report.R

# Install R packages using renv
.PHONY: install
install: Code/00_renv.R 
	Rscript Code/00_renv.R

# Code/01_table_1.R: create table 1
Output/table_1.rds: install Data/cleaned_EC_data.RDS Code/01_table_1.R 
	Rscript Code/01_table_1.R

# Code/02_table_2.R: create table 2
Output/table_2.rds: Data/cleaned_EC_data.RDS Code/02_table_2.R install
	Rscript Code/02_table_2.R
	
# Code/03_table_3.R: create table 3
Output/table_3.rds: Data/cleaned_EC_data.RDS Code/03_table_3.R install
	Rscript Code/03_table_3.R

# Code/04_figure_1.R: create figure 1
Output/figure_1.rds: Data/cleaned_EC_data.RDS Code/04_figure_1.R install
	Rscript Code/04_figure_1.R

# remove all files generated above
.PHONY: clean
clean:
	rm -f Output/*.rds && rm -f Final-Report.html