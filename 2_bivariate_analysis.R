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

# type of listing vs year added ----
netflix |>
  mutate(
    date_added = lubridate::mdy(date_added), # converting col to date type
    year_added = lubridate::year(date_added) # extracting year added
  ) |>
  count(type, year_added) |>
  ggplot(aes(year_added, n, color = type)) +
  geom_line() +
  scale_x_continuous(
    breaks = seq(2008, 2021, 1),
    expand = c(0, 0)
    ) +
  labs(
    title = "TBA",
    caption = "TBA",
    x = "Year Added",
    y = "Counts",
    color = "Type of Listing"
  ) +
  theme_minimal() 

