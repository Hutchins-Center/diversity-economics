library(RSelenium)
#docker pull selenium/standalone-chrome
#docker run -d -v ~/Documents/Projects/diversity-economics:/home/seluser/Downloads -p 4445:4444 selenium/standalone-chrome
eCaps <- list(
  chromeOptions = 
    list(
      prefs = list("profile.default_content_settings.popups" = 0L,
                   "download.prompt_for_download" = FALSE,
                   "download.default_directory" = "home/seluser/Downloads")
    )
)
remDr <- RSelenium::remoteDriver(remoteServerAddr = 'localhost',
                    port= 4445L,
                    extraCapabilities = eCaps,
                    browserName = 'chrome')

remDr$open(silent = TRUE)

# navigate to the website of interest
remDr$navigate("https://www.fedscope.opm.gov/ibmcognos/bi/v1/disp?b_action=powerPlayService&m_encoding=UTF-8&BZ=1AAABnhOp%7EWx42oVOy26DMBD8GS9pD43Wy%7EvAAWyjILWQBu4VIU4UFTAiXPL3FXBI20tmtNJodkYaqyy2ZVUcVCaj22RGnckXILoqEh73Hc%7EhInFs3w9UwGPuJwqlH9rkAdGrNXdVfBC7fVztIqC0Mf2k_wkoPZv2pEdwE3CwrzsNttzs6_a7vujbl_qG1tw73U8bcCVQOqyfv%7EFHCgjfgLDUw6S7ox6BcOZctmQptqLIcyWqrMjz_ENFT4tW8hmdERlHRM6RMYbMRUbIZjIWX3Tf3IEQ6ASEcdsChu_mqaer6f%7EZDCgAshFIc6AjULga%7EGGwBUD2HP8FvnBR65jl1gkrfgA1H2oj")
# confirm you got there
remDr$getTitle()

remDr$screenshot(display = TRUE)
webElement <- remDr$findElement("class name", "dimbar")
<frame name="ActionPane" src="/ibmcognos/bi/v1/disp?b_action=ppfetchfile.absolute&amp;pps_tracking=5000;dd2qM8yqw8l4q4jj9jslMqj4wsjjMq8l4MGM2Gvd;MzNEMzdFQjMtMjY5QS00QjBFLUJBQTEtNDA4RkY0MjczMUZF;11412;conversationComplete&amp;m_encoding=UTF-8&amp;FN2=MzA4MURGMDYwOTJBODY0ODg2RjcwRDAxMDcwNkEwODFEMTMwODFDRTAyMDEwMDMwODFDODA2MDAzMDFEMDYwOTYwODY0ODAxNjUwMzA0MDEwMjA0MTA1MDMyNUQzMDZBMjYzMTM0NDQzNjQ3NTQ3MjNENDIzQjgwODFBNEFGQTU3NDYzMjU0Q0Y3QUJBMzI1NzU0NTFFMzJDM0E0NTk1RkQ5MzQ0RTVCM0FFNDU4NDM5QkQxNzJFQTYyRkU5RDU0NzlGRkJGN0NGOEE0MEFDMkY0ODM2RDJCQzg2NzAxQUQxQ0RBREEzRjAzNkI0REE2QTJBRjJCNkUyNTA0N0I2NzFDMzk5RThCNzM5QzM1NjlCQjQzMzZCOENBMzcwOUJDQTFEREQ2M0M1Q0YyMzJENzlGMDM2QTY1ODQ2QTAyOUNCNEJEM0IzNDY5MUQyRkQ4NkYyMzg0RDI5MDQ4RUNDRTZCRTRCQzlBM0IzOTNGNzkzRDAxMDEyMDIzQzg2NzEwMTkyRjEwRTFBRDA5Qjg5RDZENDAxQzQ1QjI2RjIzODBFOTIzM0UyNUQwQ0ZCOUVCRjFFMUUwN0E0ODU0Njg1RkU5MjVzcGxpdHRlcjAyMDcwMDAwMDA1MzQ4NDEyRDMyMzUzNkNBQkY0ODM4RUIyNDA1RUM3Q0UyMzZCMUI0MjcxQzFBNUJCMTQ3REI3N0Q4QzE0MjhENjY1QTgzNEUzMkEwRDk=" marginwidth="0" marginheight="0" scrolling="auto" onresize="actPaneResize(event);">
  
  remDr$navigate("/ibmcognos/bi/v1/disp?b_action=ppfetchfile.absolute&amp;pps_tracking=5000;dd2qM8yqw8l4q4jj9jslMqj4wsjjMq8l4MGM2Gvd;MzNEMzdFQjMtMjY5QS00QjBFLUJBQTEtNDA4RkY0MjczMUZF;11412;conversationComplete&amp;m_encoding=UTF-8&amp;FN2=MzA4MURGMDYwOTJBODY0ODg2RjcwRDAxMDcwNkEwODFEMTMwODFDRTAyMDEwMDMwODFDODA2MDAzMDFEMDYwOTYwODY0ODAxNjUwMzA0MDEwMjA0MTA1MDMyNUQzMDZBMjYzMTM0NDQzNjQ3NTQ3MjNENDIzQjgwODFBNEFGQTU3NDYzMjU0Q0Y3QUJBMzI1NzU0NTFFMzJDM0E0NTk1RkQ5MzQ0RTVCM0FFNDU4NDM5QkQxNzJFQTYyRkU5RDU0NzlGRkJGN0NGOEE0MEFDMkY0ODM2RDJCQzg2NzAxQUQxQ0RBREEzRjAzNkI0REE2QTJBRjJCNkUyNTA0N0I2NzFDMzk5RThCNzM5QzM1NjlCQjQzMzZCOENBMzcwOUJDQTFEREQ2M0M1Q0YyMzJENzlGMDM2QTY1ODQ2QTAyOUNCNEJEM0IzNDY5MUQyRkQ4NkYyMzg0RDI5MDQ4RUNDRTZCRTRCQzlBM0IzOTNGNzkzRDAxMDEyMDIzQzg2NzEwMTkyRjEwRTFBRDA5Qjg5RDZENDAxQzQ1QjI2RjIzODBFOTIzM0UyNUQwQ0ZCOUVCRjFFMUUwN0E0ODU0Njg1RkU5MjVzcGxpdHRlcjAyMDcwMDAwMDA1MzQ4NDEyRDMyMzUzNkNBQkY0ODM4RUIyNDA1RUM3Q0UyMzZCMUI0MjcxQzFBNUJCMTQ3REI3N0Q4QzE0MjhENjY1QTgzNEUzMkEwRDk=")
remDr$getTitle()
