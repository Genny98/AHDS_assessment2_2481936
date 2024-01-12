Health Data Analysis Compendium: BMI and Gender Study
Overview
This compendium encompasses all resources and datasets integral to the "Body Mass Index (BMI) and Gender" analysis. The core objective of this analysis is to explore the relationship between BMI and gender across a demographically diverse population, primarily utilizing data derived from the National Health and Nutrition Examination Survey (NHANES).
Structure of the Compendium
•	raw_data: This directory houses the unaltered, original datasets.
•	clean_data: Contains the processed datasets, where meticulous data cleaning and merging procedures have been executed.
•	Code: This directory is the repository for the R script employed for data processing (data_merge.R) is.
•	visualisation: Encompasses the interactive Shiny application (shiny.R) designed for dynamic data visualization, along with any resultant plots or figures.
Development Environment
•	Operating System: Developed on macOS, leveraging the versatility and efficiency of the Unix-based environment.
•	Command Line Interface: Utilized macOS Terminal for executing Git commands, script running, and other command-line tasks.
•	Version Control: Source code and documentation are version-controlled using Git, with the repository hosted on GitHub for collaborative development and version tracking. The GitHub repository is accessible at [https://github.com/Genny98/AHDS_assessment2_2481936].

Guidelines for Usage
To replicate the components of this study, the following steps should be undertaken:
1.	Data Preparation: Initiate the process by executing data_merge.R located in the code directory, which is pivotal for merging and cleansing the raw data.
2.	Data Analysis and Visualization: Proceed with shiny.R for an in-depth analytical exploration and visualization of the BMI and gender data.
Prerequisites
•	Fundamental requirements include R and RStudio.
•	Necessary R packages: shiny, ggplot2, readr, and dplyr.

