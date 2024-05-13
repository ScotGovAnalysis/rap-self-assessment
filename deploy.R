
library(rsconnect)

# Check scotland.shinyapps.io account registered on local system 
# and if not, set up

if(!"scotland" %in% accounts(server = "shinyapps.io")$name) {
  setAccountInfo(
    name = "scotland",
    token = rstudioapi::askForPassword("Enter token: "),
    secret = rstudioapi::askForPassword("Enter secret: ")
  )
}

# Deploy app to shinyapps.io

deployDoc(
  "self-assess.qmd",
  appName = "sg-rap-self-assessment",
  account = "scotland"
)
