library(quarto)

quarto_publish_app(
  title = "ab-test",
  server = "shinyapps.io",
  account = "alicebyers",
  render = "server"
)
