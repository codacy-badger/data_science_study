####
#RJDBC
# Based on JDBC (Java Database Connectivity)
####

# install[dot]packages("RJDBC") run on CLI
library(RJDBC)
#Enter the values for you database connection
load("output/database_connection.Rds") #obfuscated

#create connection
jcc <- JDBC("com.ibm.db2.jcc.DB2Driver", "db2jcc4.jar");
jdbc_path <- paste("jdbc:db2://",  dsn_hostname, ":", dsn_port, "/",
  dsn_database, sep = "");
conn <- dbConnect(jcc, jdbc_path, user = dsn_uid, password = dsn_pwd)

#create a query
query <- "SELECT * FROM GOSALES.ORDER_DETAILS";
rs <- dbSendQuery(conn, query);
df <- fetch(rs, -1);

#disconnect
dbDisconnect(conn)

####
#RODBC
# Based on ODBC (Open Database Connectivity)
####

# install[dot]packages("RODBC") run on CLI
library(RODBC)
dsns <- odbcDataSources() #determines databases accessible
