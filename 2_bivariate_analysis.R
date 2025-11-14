## STAT 302 Final Project ----
# Bivariate Analysis ----


# type of listing vs year released ----
netflix |>
  count(type, release_year) |>
  ggplot(aes(release_year, n, color = type)) +
  geom_line()


