# Packages ----
library(DBI)
library(odbc)
library(dplyr)
library(dbplyr)

# Connect ----
con <- dbConnect(odbc::odbc(), "snowflake")

# Write data ----
copy_to(con, nycflights13::airlines, "AIRLINES", temporary = FALSE, overwrite = TRUE)
copy_to(con, nycflights13::airports, "AIRPORTS", temporary = FALSE, overwrite = TRUE)
copy_to(con, nycflights13::flights, "FLIGHTS", temporary = FALSE, overwrite = TRUE)
copy_to(con, nycflights13::planes, "PLANES", temporary = FALSE, overwrite = TRUE)
copy_to(con, nycflights13::weather, "WEATHER", temporary = FALSE, overwrite = TRUE)

# Disconnect ----
dbDisconnect(con)
