## STAT 302 Final Project ----
# Bivariate Analysis ----

# load packages ---
library(tidyverse)

# read in data ----
netflix <- read_csv("data/netflix_titles.csv")

# type of listing vs year released ----
netflix |>
  count(type, release_year) |>
  ggplot(aes(release_year, n, color = type)) +
  geom_line()


