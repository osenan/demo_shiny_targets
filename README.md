# Demo Shiny - Targets

This repository contains an example of how to combine targets within a Shiny App.
The purpose of this demo is to show how to automatically write and edit the targets pipeline from Shiny, load targets outputs to Shiny and use them.

### Worflow

Current setup requires to run the pipeline as a side process to the app.

To learn how to run the targets pipeline from within Shiny, [check this example](https://github.com/wlandau/targets-shiny).


Please follow this steps to run the application:


1. Run the app. On first table, you will be asked to select columns. Select those columns that
you do not want to include in cleaned dataset. Once you are finished click "Write Pipeline".
2. From a R session run the pipeline with `tar_make()`
3. If you do not run the pipeline you will not be able to see clean table and the plot.
4. Once you run the pipeline continue exploring the app. Now you are reading and using data
from targets.
