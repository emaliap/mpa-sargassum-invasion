# Title...
EDS 222 Final Project

## Repository purpose

Contains the script **mpa-sargassum-invasion.qmd** used to .... and **blog-post.qmd** ....

blog post on [Title...](https://emaliap.github.io/mpa-sargassum-invasion/reports/blog-post.html)

## Repository Structure

```{}

 .
    ├── README.md
    ├── mpa-sargassum-invasion.qmd # Quarto with all code needed for analysis
    ├── _quarto.yml # Tells Quarto to render blog post into docs/
    ├── data/       # Raw input data and metadata (never edited by hand)
    ├── docs/       # Rendered blog post, published with GitHub Pages
    ├── output/     # Cleaned data and other intermediate files
    ├── R/          # R scripts with function definitions
    └── reports/
        └── blog-post.qmd # Quarto for rendering blogpost

```

## Data access

**.gitignore** removes **data/** from this repository

The zero populated datasets were shared directly from UCSB PISCO. To download an open source version of the data, go to [DataONE](https://search.dataone.org/view/doi%3A10.6085%2FAA%2FPISCO_kelpforest.1.11). 

Data files used in **mpa-sargassum-invasion.qm** analysis include:

1) `PISCO_fish_site_mean_bm_2016-2025.csv` contains site mean biomass of CA sheephead from 2016 - 2025
2) `PISCO_swath_site_mean_den_2016-2025.csv` contains site mean densities of urchins, CA spiny lobster, and native understory brown algae from 2016 - 2025
3) `PISCO_upc_site_mean_pctcover_2016-2025_EP.csv` contains site mean percent cover of *S. horneri* and native fleshy red algae from 2016 - 2025

## Author

Emalia Partlow

## References

Caselle, Jennifer E., Kathryn Davis, and Lindsay M. Marks. 2017. “Marine Management Affects the Invasion Success of a Non-Native Species in a Temperate Reef System in California, USA.” *Ecology Letters* 21 (1): 43–53. [https://doi.org/10.1111/ele.12869]().

Marks, Lindsay M., Daniel C. Reed, and Sally J. Holbrook. 2020. “Niche Complementarity and Resistance to Grazing Promote the Invasion Success of *Sargassum Horneri* in North America.” *Diversity* 12 (2): 54. [https://doi.org/10.3390/d12020054]().

Mark H. Carr, Jennifer E. Caselle, Daniel P. Malone, Avrey Parsons-Field, & Katelin D. Seeto. (2026). *PISCO Kelp Forest Community Surveys*. PISCO MN. [doi:10.6085/AA/PISCO_kelpforest.1.11]().