## STAT 302 Final Project ----
# Univariate Analysis ----

# load packages ---
library(tidyverse)

# read in data ----
netflix <- read_csv("data/netflix_titles.csv")

# distinct countries
netflix |>
  separate_rows(country, sep = ",\\s*") |>
  distinct(country) |>
  filter(!is.na(country) & country != "NA")

# distinct genres
netflix |>
  separate_rows(listed_in, sep = ",\\s*") |>
  distinct(listed_in) |>
  filter(!is.na(listed_in) & listed_in != "NA")


## plotting distribution of  ----
# netflix |>
#   ggplot(aes(`Reference area`)) +
#   geom_bar(fill = "cadetblue") +
#   coord_flip() +
#   labs(
#     y = "Number of Observations",
#     x = "Reference Area")

## bar graph that shows the number of observations within each year in the dataset ----
netflix |>
  ggplot(aes(release_year)) +
  geom_bar(fill = "black") +
  labs(
    x = "Release Year"
  ) +
  theme_minimal()
