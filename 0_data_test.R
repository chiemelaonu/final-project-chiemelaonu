## STAT 302 Final Project ----

# load packages ---
library(tidyverse)

# read in and inspect data ----
netflix <- read_csv("data/netflix_titles.csv")


# number of missing values
sum(is.na(netflix))

# distinct number of values for visualization ----
netflix |>
  distinct(title)

netflix |>
  distinct(country)

# distinct countries
netflix |>
  separate_rows(country, sep = ",\\s*") |>
  distinct(country) |>
  filter(!is.na(country) & country != "NA")


# distinct genres 
netflix |> 
  distinct(listed_in)

netflix |>
  separate_rows(listed_in, sep = ",\\s*") |>
  distinct(listed_in) |>
  filter(!is.na(listed_in) & listed_in != "NA")


