# Scottish Government RAP Self-Assessment Tool

This repository contains the code for a [self-assessment tool](https://scotland.shinyapps.io/sg-rap-self-assessment/) used by Scottish Government statisticians to track their progress in developing [Reproducible Analytical Pipelines (RAP)](https://analysisfunction.civilservice.gov.uk/support/reproducible-analytical-pipelines/).

The tool allows the user to assess their progress against various criteria of RAP organised into different levels of maturity. Once an assessment has been made, the user can choose to download a summary report of their responses and/or a csv data file.


## Repository structure

### self-assess.qmd

This is the main script used to produce the tool. It is a [Quarto](https://quarto.org/) document with [Shiny elements embedded](https://quarto.org/docs/interactive/shiny/).


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

* `criteria.rds`: Defines each criteria and which RAP level they pertain to

The `data-raw` folder contains the R code used to produce these files.


### Other files

* `styles.scss`: An [SCSS style sheet](https://sass-lang.com/documentation/syntax/#scss) used for the tool and output report.

* `partials/title-block.html`: An html file defining the layout of the title block used in both the tool and output report.

* `images/SG-logo.jpg`: Scottish Government logo used in the title block.

* `README.md`: This document.

* `.gitignore`: A file specifying which files should be ignored by Git.

* `rap-self-assessment.Rproj`: An [RStudio Project](https://support.posit.co/hc/en-us/articles/200526207-Using-RStudio-Projects) file.


## Contributing

If you have any feedback or suggestions, please [open an issue](https://github.com/ScotGovAnalysis/rap-self-assessment/issues) in the first instance.


## Contact

This repository is maintained by [Alice Hannah](mailto:alice.hannah@gov.scot).


## Licence

Unless stated otherwise, the codebase is released under [the MIT License](LICENCE.md). This covers both the codebase and any sample code in the documentation.

The documentation is [© Crown copyright](http://www.nationalarchives.gov.uk/information-management/re-using-public-sector-information/uk-government-licensing-framework/crown-copyright/) and available under the terms
of the [Open Government 3.0](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/) licence.