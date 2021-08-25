ui <- fluidPage(
  h1("Demo Shiny-Targets"),
  h3("Raw Data"),
  p("Select columns that will be removed"),
  DTOutput("raw_table"),
  actionButton("write_pipeline", "Write Pipeline", icon = icon("tools")),
  h3("Clean Data"),
  p("Select columns to display in plot"),
  DTOutput("clean_table"),
  plotlyOutput("plot")
)
