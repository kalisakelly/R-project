


  
  ```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```


library(readr)
library(dplyr)
library(ggplot2)
library(tidyr)

data_population <- read_csv("world_population.csv")
data_CO2 <- read_csv("CO2_emission.csv")


#Data columns and rows

variable.names(data_population)
variable.names(data_CO2)


head(data_population)
head(data_CO2)

#Data types of the column
str(data_population)
str(data_CO2)

#Getting the number of rows and columns
dim(data_population)
dim(data_CO2)

# number of rows only
nrow(data_population)
nrow(data_CO2)

# number of Colums only
ncol(data_population)
ncol(data_CO2)


# Displaying n number of rows

head(data_population,10)


# identifying the duplicates

duplicated(data_population)
duplicated(data_CO2)

sum(duplicated(data_population))
sum(duplicated(data_CO2))

unique(data_population)
unique(data_CO2)

# identifying the null values

is.na(data_population)
sum(is.na(data_population))
is.na(data_CO2)
sum(is.na(data_CO2))


#Getting missing value of every column

colSums(is.na(data_population))

colSums(is.na(data_CO2))

missing_values <- colSums(is.na(data_population))

names(missing_values)


summary(data_population)

#identify duplicate names
data_population$`Country/Territory`
duplicated(data_population$`Country/Territory`)
#count
sum(duplicated(data_population$`Country/Territory`))

which.max(missing_values)

boxplot(data_population$`Density (per km²)`)

summary(data_population$`Density (per km²)`)

boxplot.stats(data_population$`Density (per km²)`)$out


#Calculation of expected

summary(data_population$`Growth Rate`)

boxplot(data_population$`Growth Rate`)


p <-data_population$`2022 Population`
r <-data_population$`Growth Rate`
t <-8
r

p * exp(r * t)

data_population_2030 <- data_population %>%
  mutate(
    Population_2030 =
      `2022 Population` *
      exp(log(`Growth Rate`) * (2030 - 2022))
  )

data_population_2030

options(scipen = 999)

head(data_population_2030$Population_2030, 10)

data_population_2030 %>%
  select(`Country/Territory`, `2022 Population`,
         `Growth Rate`, Population_2030) %>%
  head(10)


top_10 <- data_population %>%
  arrange(desc(`2022 Population`)) %>%
  slice_head(n = 10)


ggplot(top_10, aes(x = reorder(`Country/Territory`,
                               `2022 Population`),
                   y = `2022 Population`)) +
  geom_col(fill = "steelblue") +
  labs(
    title = "Top 10 Most Populated Countries in 2022",
    x = "Country",
    y = "Population"
  ) +
  theme_minimal()

population_trend <- top_10 %>%
  select(
    `Country/Territory`,
    `1990 Population`,
    `2000 Population`,
    `2010 Population`,
    `2015 Population`,
    `2020 Population`,
    `2022 Population`
  ) %>%
  pivot_longer(
    cols = -`Country/Territory`,
    names_to = "Year",
    values_to = "Population"
  )

View(population_trend)


ggplot(population_trend,
       aes(x = Year,
           y = Population,
           color = `Country/Territory`,
           group = `Country/Territory`)) +
  geom_line(linewidth = 1) +
  geom_point() +
  labs(
    title = "Population Growth of the Top 10 Countries (1990–2022)",
    x = "Year",
    y = "Population",
    color = "Country"
  ) +
  theme_minimal()


#

co2_2019 <- data_CO2 %>%
  filter(Year == 2019...35) %>%
  select(Country, `CO2 emission (Tons)`)

merged_data <- data_population %>%
  select(`Country/Territory`, `2022 Population`) %>%
  inner_join(
    co2_2019,
    by = c("Country/Territory" = "Country")
  )

names(data_CO2)

data_CO2 %>%
  select(`Country Name`, `Indicator Name`,
         `2019...34`, `2019...35`) %>%
  head(10)

