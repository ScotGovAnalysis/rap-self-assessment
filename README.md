# Scottish Government RAP Self-Assessment Tool

[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)

This repository contains the code for a self-assessment tool used by Scottish Government statisticians to track their progress in developing [Reproducible Analytical Pipelines (RAP)](https://analysisfunction.civilservice.gov.uk/support/reproducible-analytical-pipelines/).

The tool allows the user to assess their progress against various criteria of RAP organised into different levels of maturity. Once an assessment has been made, the user can choose to download a summary report of their responses and/or a csv data file.

The self-assessment tool can be found at \<insert link here\>.

## Repository structure

### self-assess.qmd

This is the main script used to produce the tool. It is a [Quarto](https://quarto.org/) document with [Shiny elements embedded](https://quarto.org/docs/interactive/shiny/). There are four general sections to this script:

* Set up: R code to be run before anything else and required by both UI and Server elements.

* Sidebar: User interface containing metadata input fields and download buttons.

* Main body: User interface containing the main body of the self-assessment form.

* Shiny server: Server for reactive elements.


### quarto-docs/

This folder contains various Quarto documents for either:

* repeated elements of the main self-assessment tool

* the output report

A sub-folder called `help/` contains the information supplied in the 'What does this mean?' sections for each criteria.


### modules/

This folder mostly contains [Shiny modules](https://shiny.posit.co/r/articles/improve/modules/) used in the tool. The R function `level_label.R` is also stored in this folder. 


### data/ and data-raw/

The following files can be found in the `data` folder:

* `levels.rds`: Defines the levels of RAP

* `options.rds`: Sets the options available for self-assessment

* `criteria.csv`: Defines each criteria and which RAP level they pertain to

The `data-raw` folder contains the R code used to produce `levels.rds` and `options.rds`.


### Other files

* `styles.scss`: An [SCSS style sheet](https://sass-lang.com/documentation/syntax/#scss) used for the tool and output report.

* `README.md`: This document.

* `.gitignore`: A file specifying which files should be ignored by Git.

* `rap-self-assessment.Rproj`: An [RStudio Project](https://support.posit.co/hc/en-us/articles/200526207-Using-RStudio-Projects) file.


## Contributing

If you have any feedback or suggestions, please [open an issue](https://github.com/ScotGovAnalysis/rap-self-assessment/issues) in the first instance.


## Contact

This repository is currently maintained by [Alice Byers](mailto:alice.byers@gov.scot).
