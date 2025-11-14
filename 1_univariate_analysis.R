## STAT 302 Final Project ----
# Univariate Analysis ----

# load packages ---
library(tidyverse)

# read in data ----
netflix <- read_csv("data/netflix_titles.csv")

# analysis ----

# distinct countries
countries <- netflix |>
  separate_rows(country, sep = ",\\s*") |>
  distinct(country) |>
  filter(!is.na(country), country != "NA")

# number of times each country appears in dataset 
country_counts <- netflix |>
  separate_rows(country, sep = ",\\s*") |>
  count(country, sort = TRUE) |>
  na.omit() 


# distinct genres
netflix |>
  separate_rows(listed_in, sep = ",\\s*") |>
  distinct(listed_in) |>
  filter(!is.na(listed_in) & listed_in != "NA")

# number of times each genre/category appears in dataset 
genre_counts <- netflix |>
  separate_rows(listed_in, sep = ",\\s*") |>
  count(listed_in, sort = TRUE) |>
  na.omit() 

# plot of genre counts
genre_counts |>
  ggplot(aes(listed_in, n)) +
  geom_col() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 5)
  )

# date added col
netflix <- netflix |>
  mutate(
    date_added = lubridate::mdy(date_added), # converting col to date type
    year_added = lubridate::year(date_added) # extracting year added
    )

year_counts <- netflix |> # counting frequency years appear in dataset
  count(year_added, sort = TRUE) |>
  na.omit()

year_counts |> # plotting frequencies
  ggplot(aes(year_added, n)) +
  geom_col(fill = "#4E2A84") +
  scale_x_continuous(
    breaks = seq(2008, 2021, 1),
    expand = c(0, 0)
  ) +
  labs(
    title = "TBA",
    caption = "TBA",
    x = "Year Added",
    y = "Counts"
  ) +
  theme_minimal() 

## plotting distribution of  ----
# netflix |>
#   ggplot(aes(`Reference area`)) +
#   geom_bar(fill = "cadetblue") +
#   coord_flip() +
#   labs(
#     y = "Number of Observations",
#     x = "Reference Area")

## bar graph that shows the number of observations within each release year in the dataset ----
netflix |>
  ggplot(aes(release_year)) +
  geom_bar(fill = "#B6ACD1") +
  labs(
    x = "Release Year"
  ) +
  theme_minimal()

# count number of tv shows and movies in dataset
netflix |>
  count(type, sort = TRUE) |>
  na.omit() |>
  ggplot(aes(type, n)) +
  geom_col(fill = "lightblue") +
  labs(
    title = "TBA",
    caption = "TBA",
    x = "Type of Listing",
    y = "Count"
  ) +
  theme_minimal()


