# Penguin data analysis
# MSc Introduction to Git and GitHub

library(tidyverse)
penguins <- read.table("data/penguin_data.txt", header = TRUE)
glimpse(penguins)
model1 <- lm(body_mass_g ~ flipper_length_mm, data = penguins)
summary(model1)
ggplot(penguins,
       aes(x = flipper_length_mm,
           y = body_mass_g,
           colour = species)) +
  geom_point() +
  stat_smooth(method = "lm")
ggsave("figs/1_flipper_bodymass_regression.png")
penguins_female <- subset(penguins, sex == "female")
glimpse(penguins_female)
write_tsv(penguins_female, "results/1_penguin_female_only.txt")
# Analysis complete