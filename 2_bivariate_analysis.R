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
    breaks = seq(2008, 2021, 1), # range for plot
    expand = c(0, 0) # remove extra space
    ) +
  scale_color_manual(
    values = c("Movie" = "#FF9F9B", "TV Show" = "#A1C9F4"), # changing colors for lines
    labels = c("Movie", "TV Show"), # adding labels for the legend
    name = NULL
  ) +
  labs(
    title = "TBA",
    caption = "TBA",
    x = "Year Added",
    y = "Counts"
  ) +
  theme_classic() +
  theme(
    legend.position = c(0.5, 1),
    legend.justification = c(0.5, 1), # legend positioning
    legend.direction = "horizontal"
  )

