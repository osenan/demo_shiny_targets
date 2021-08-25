ui <- fluidPage(
  h1("Demo Shiny-Targets"),
  h3("Raw Data"),
  p("Select columns that will be removed"),
  DTOutput("raw_table"),
  actionButton("write_pipeline", "Write Pipeline", icon = icon("tools")),
  h3("Raw Data"),
  DTOutput("clean_table")
)
