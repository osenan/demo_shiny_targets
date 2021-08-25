server <- function(input, output) {
  output$raw_table = renderDT(
    data, 
    options = list(scrollX = TRUE), 
    filter = list(position = "top", clear = "false", autoWidth = TRUE),
    selection = list(target = "column"))
  
  observeEvent(input$write_pipeline, {
    write_pipeline(input$raw_table_columns_selected)
    showModal(modalDialog(
      "A new pipeline has been created"
    ))
  })
  
  output$clean_table = renderDT( {
    data <- tryCatch(tar_read(processed_data), 
            error = function(err) NULL)
    validate(need(!is.null(data), "Please run pipeline to display clean table"))
    data
  }, options = list(scrollX = TRUE),
  selection = list(target = "column", mode = "single"))
  
  output$plot <- renderPlotly({
    data <- tryCatch(tar_read(processed_data), 
                     error = function(err) NULL)
    validate(need(!is.null(data), "Please run pipeline to display clean table"))
    index <- input$clean_table_columns_selected
    validate(need(!is.null(index), "Please select one column to diplay histogram"))
    var <- colnames(data)[input$clean_table_columns_selected]
    plot_hist(data, var)
  })
}
