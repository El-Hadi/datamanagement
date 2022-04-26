



#' This package will create a function called create_project()
#'
#' It's callback is at: inst/rstudio/templates/project/create_project.dcf
#'
#' @export
#'
create_project <- function(path, ...){


  #creation du projet avec le repertoire choisi par l'utilisateur
  dir.create(path, recursive = TRUE, showWarnings = FALSE)


  #changement du repertoir courant
  setwd(file.path(getwd(), path))


  file.create("Coherence.R")


cat("rm(list = ls())


#lecture des libraries
library(tidyverse)
library(ClinData2)
library(janitor)
library(Hmisc)
#library(clindata)
library(lubridate)
library(readxl)
library(openxlsx)

source('01_init_transform.R', encoding = 'UTF-8')



#initialation de la table des requettes ----

#rm('test')

test <-
  tibble::tibble(
    id_patient = character(),
    Centre = character(),
    Fichier = character(),
    Var = character(),
    Val = character(),
    Label=character(),
    Text = character(),
    Nquerie = integer()
  )

i <- 0




    "


    , file = "Coherence.R" )


  #Creation du fichier des transformations
  file.create("01_init_transform.R")

  cat("
      #rm(list = ls())
library(tidyverse)
library(janitor)
library(Hmisc)
library(ClinData2)
library(lubridate)
library(readxl)
library(openxlsx)
library(tictoc)



#Date d'extraction ----

if(!exists('date_extract')){
  date_extract <- '20220404'
}



#lecture du dictionnaire ----

dhm_path<- fs::dir_ls('Documents/', glob = '*.xls') %>%
  enframe() %>%
  filter(str_detect(name, 'Data Handling Manual')) %>%
  pull(name)

dhm <-read_xls(dhm_path)

dhm <- dhm %>%
       mutate(Référence=str_replace_all(Référence, '-', '_'))

#lecture et transformation de la base
setInit(date_extract, dhm)


      ", file="01_init_transform.R")


  #creation des dossiers documents et donnees
  dir.create("Documents", recursive = TRUE, showWarnings = FALSE)

  dir.create("Donnees", recursive = TRUE, showWarnings = FALSE)



  dots <- list(...)



  # # Check .gitignore argument
  # if(dots[["createGitignore"]]) {
  #   git_ignores <-
  #     c(
  #       '.Rhistory',
  #       '.Rapp.history',
  #       '.RData',
  #       '.Ruserdata',
  #       '.Rproj.user/',
  #       '.Renviron'
  #     )
  #   writeLines(paste(git_ignores, sep = '\n'), '.gitignore')
  # }


  # if(dots[["folder"]] == "Production"){
  #   dir.create("production", recursive = TRUE, showWarnings = FALSE)
  # } else {
  #   dir.create("development", recursive = TRUE, showWarnings = FALSE)
  # }

}
