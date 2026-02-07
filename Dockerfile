FROM rocker/rstudio:4.4.2

# USER root

WORKDIR /home/rstudio/project


COPY renv.lock renv.lock
COPY renv/activate.R renv/activate.R
COPY .Rprofile .Rprofile
COPY useLibrary.R useLibrary.R

RUN R --vanilla -e "install.packages('renv', repos = 'https://cloud.r-project.org')"
# USER rstudio

RUN R --vanilla -e "renv::restore()"

