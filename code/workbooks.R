library("r2excel")
library('snakecase')

gender_cabinet <- 
  readxl::read_xlsx('data/gender-cabinet-agencies.xlsx', skip = 1) %>%
  clean_names()  %>%
  rename(agency = employment_as_values) %>%
  mutate(
    across(
      .cols = -c('agency'),
      .fns = ~ as.numeric(.x)
    )
  )

filename <- "tables/diversity.xlsx"
wb <- createWorkbook(type="xlsx")
# Create a sheet in that workbook to contain the data table
sheet <- createSheet(wb, sheetName = "gender-cabiet")

# Add header
xlsx.addHeader(wb, sheet, value="Gender distribution for cabinet agencies",level=1, 
               color="black", underline=1)
xlsx.addLineBreak(sheet, 2)


# Add table : add a data frame
xlsx.addTable(wb, sheet, data= gender_cabinet,
              fontColor="darkblue", fontSize=12,
              rowFill=c("white", "lightblue")
)


# save the workbook to an Excel file
saveWorkbook(wb, filename)
xlsx.openFile(filename)# View the file
race <- 
  readxl::read_xlsx('data/minority-cabinet-agencies.xlsx', sheet = 'race-ethnicity', skip = 1)

minority<-
  readxl::read_xlsx('data/minority-cabinet-agencies.xlsx', skip = 1) 
minority_all <-
  readxl::read_xlsx('data/minority-all-agencies.xlsx', skip = 1) 
xlsx.writeMultipleData('data/master.xlsx', gender_cabinet,  minority, minority_all)


