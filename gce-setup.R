install.packages("testthat")
install.packages("googleComputeEngineR")
library(testthat)
library(googleComputeEngineR)


# setup -------------------------------------------------------------------
project <- "project-name"
zone <- "zone-name"
account_key <- "key-name.json"

Sys.setenv(GCE_AUTH_FILE = account_key,
           GCE_DEFAULT_PROJECT_ID = project,
           GCE_DEFAULT_ZONE = zone)

options(googleAuthR.scopes.selected = "https://www.googleapis.com/auth/cloud-platform")

gce_auth()


# set our default global project ------------------------------------------
gce_global_project(project)
gce_global_zone(zone)

default_project <- gce_get_project("project-name")
default_project$name


# set up vm ---------------------------------------------------------------
vm <- gce_vm(template = "rstudio",
             name = "demo",
             username = "demo-user",
             password = "demo-pass",
             predefined_type = "n1-highmem-2")

my_rstudio <- gce_vm("project-name")


# stop vm -----------------------------------------------------------------
gce_vm_delete(vm,
              project = gce_get_global_project(),
              zone = gce_get_global_zone())