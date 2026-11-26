library(tidyverse)
library(dplyr)

# Read in swath data
swath <- read_csv(
  "data/PISCO_swath_site_mean_den_2016-2025.csv"
) |>
  mutate(across(where(is.character), str_to_lower)) |> # Change all string values in columns to lower case
  rename_with(str_to_lower) # Change column names to lower case

# Read in UPC data
upc <- read_csv(
  "data/PISCO_upc_site_mean_pctcover_2016-2025_EP.csv"
) |>
  mutate(across(where(is.character), str_to_lower)) |>
  rename_with(str_to_lower)

# Read in fish data
fish <- read_csv(
  "data/PISCO_fish_site_mean_bm_2016-2025.csv"
) |>
  mutate(across(where(is.character), str_to_lower)) |>
  rename_with(str_to_lower)

# Create protection zone variables storing site names
new_smr <- c(
  "anacapa_middle_isle_cen",
  "anacapa_middle_isle_e",
  "anacapa_middle_isle_w"
)
old_smr <- c(
  "anacapa_east_isle_cen",
  "anacapa_east_isle_e",
  "anacapa_east_isle_w"
)
smca <- c(
  "anacapa_west_isle_cen",
  "anacapa_west_isle_e",
  "anacapa_west_isle_w"
)
reference <- c(
  "anacapa_lighthouse_reef_cen",
  "anacapa_lighthouse_reef_e",
  "anacapa_lighthouse_reef_w"
)

# Create a dataframe with sites labeled by protection zone for later join()
protection_zone_sites <- tibble(
  protection_zone = c(
    # Repeat protection zone label for the number of sites in that zone
    rep("New SMR", length(new_smr)),
    rep("Old SMR", length(old_smr)),
    rep("SMCA", length(smca)),
    rep("Reference", length(reference))
  ),
  # Add sites in order of their protection zone
  site = c(new_smr, old_smr, smca, reference)
)

# Filter and clean swath dataframe
swath_clean <- swath |>
  filter(
    site %in% c(new_smr, old_smr, smca, reference) # Filter to sites of interest
  ) |>
  select(
    # Select columns of interest
    survey_year,
    site,
    den_lamfar, # Native brown algae densities
    den_steosmad,
    den_eisarbad,
    den_eisarbadsub,
    den_ptecalad,
    den_ptecaladsub,
    den_strpurad, # Purple urchin density
    den_mesfraad, # Red urchin density
    den_panint # Lobster density
  ) |>
  left_join(protection_zone_sites, by = join_by(site)) # Add corresponding protection zones to each site

# Filter and clean upc dataframe
upc_clean <- upc |>
  filter(
    site %in% c(new_smr, old_smr, smca, reference)
  ) |>
  select(
    # Select columns of interest
    survey_year,
    site,
    cover_sarhor, # S. horneri percent cover
    cover_erectred # Fleshy red algae percent cover
  ) |>
  left_join(protection_zone_sites, by = join_by(site)) # Add corresponding protection zones to each site

# Filter and clean fish dataframe
fish_clean <- fish |>
  filter(
    site %in% c(new_smr, old_smr, smca, reference),
  ) |>
  select(
    # Select columns of interes
    survey_year,
    site,
    bm_spul # CA sheephead biomass
  ) |>
  left_join(protection_zone_sites, by = join_by(site)) # Add corresponding protection zones to each site

# Create vector containing the understory brown algae that were observed at the sites during this time period. Those not included were either all NA or 0 and removed below
understory_brown <- c(
  'den_lamfar',
  'den_steosmad',
  'den_eisarbad',
  'den_eisarbadsub',
  'den_ptecalad',
  'den_ptecaladsub'
)

# Create vector containing urchin species
urchins <- c('den_mesfraad', 'den_strpurad')

# Combine all survey data into long format for summaries
all_surveys_long <- fish_clean |>
  full_join(swath_clean, by = join_by(survey_year, site, protection_zone)) |>
  full_join(upc_clean, by = join_by(survey_year, site, protection_zone)) |>
  pivot_longer(
    cols = !c(survey_year, site, protection_zone),
    names_to = "species",
    values_to = "value"
  ) |>
  mutate(
    species = replace(
      species,
      species %in% understory_brown,
      'den_understory_brown'
    ), # Group understory brown algae densities
    species = replace(species, species %in% urchins, 'den_urchins') # Group urchin densities
  )

# Create a summary dataframe with species means per year and protection zone
year_zone_mean <- all_surveys_long |>
  summarize(
    mean = mean(value),
    .by = c(species, survey_year, protection_zone)
  ) |>
  pivot_wider(
    names_from = species,
    values_from = mean
  )

# Create a summary dataframe with species means per protection zone
zone_mean <- all_surveys_long |>
  summarize(
    mean = mean(value),
    .by = c(species, protection_zone)
  )

# Create csv for cleaned and summarized dataframes
write_csv(all_surveys_long, "output/all_surveys_long.csv")
write_csv(year_zone_mean, "output/year_zone_mean.csv")
write_csv(zone_mean, "output/zone_mean.csv")
