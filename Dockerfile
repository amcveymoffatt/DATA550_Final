FROM rocker/rstudio AS step1

RUN apt-get update && sudo apt-get install -y \
    build-essential\
    libcurl4-openssl-dev \
    libxml2 \
    libicu-dev \
    libpng-dev \
    libtiff-dev \
    libjpeg-dev \
    libfribidi-dev \
    libharfbuzz-dev \
    libssl-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libwayland-dev \
    libxml2-dev \
    zlib1g-dev \
    tzdata \
    xsel \
    libv8-dev \
    pkg-config   



RUN mkdir /home/rstudio/project
WORKDIR /home/rstudio/project
RUN mkdir /home/rstudio/project/Report
RUN mkdir /home/rstudio/project/renv

COPY .Rprofile .Rprofile
COPY renv.lock renv.lock
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json
ARG FILE_NAME="Final Report.Rmd"
COPY ${FILE_NAME} ${FILE_NAME}
ENV RENV_PATHS_CACHE=renv/.cache

FROM amcveymoffatt/data550_final:step1 AS step2
RUN R -e "renv::restore(prompt=FALSE)"

FROM amcveymoffatt/data550_final:step2 AS step3
RUN R -e "install.packages('broom.helpers')"
COPY Makefile Makefile
COPY Code Code
COPY Data Data
COPY README.Rmd README.Rmd
COPY README.md README.md
COPY Output Output

FROM amcveymoffatt/data550_final:step3 AS step4
CMD ["make"]


