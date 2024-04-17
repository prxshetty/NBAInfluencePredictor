# Ensure the readr package is loaded
library(readr)

# Attempt to read the CSV file
team_cluster <- read_csv("D:/ML Projects/NBAInfluencePredictor/data/nba_2017_att_val_elo_win_housing_cluster.csv", col_types = cols(X1 = col_skip()))

# Check if 'team_cluster' is loaded successfully
if (!exists("team_cluster")) {
  stop("Data not loaded: team_cluster does not exist.")
}


cluster_to_numeric <- function(column){
converted_column <- as.numeric(unlist(column))
return(converted_column)
}

team_cluster$pcolor[team_cluster$cluster == 0] <- "red"
team_cluster$pcolor[team_cluster$cluster == 1] <- "blue"
team_cluster$pcolor[team_cluster$cluster == 2] <- "darkgreen"


s3d <- scatterplot3d(
  cluster_to_numeric(team_cluster["VALUE_MILLIONS"]),
  cluster_to_numeric(team_cluster["MEDIAN_HOME_PRICE_COUNTY_MILLIONS"]),
  cluster_to_numeric(team_cluster["ELO"]),
  color=team_cluster$pcolor,
  pch=19,
  type="h",
  lty.hplot=2,
  main="3-D Scatterplot NBA Teams 2016-2017:
  Value, Performance, Home Prices with kNN Clustering",
  zlab="Team Performance (ELO)",
  xlab="Value of Team in Millions",
  ylab="Median Home Price County Millions"
)

s3d.coords <- s3d$xyz.convert(
  cluster_to_numeric(team_cluster["VALUE_MILLIONS"]),
  cluster_to_numeric(team_cluster["MEDIAN_HOME_PRICE_COUNTY_MILLIONS"]),
  cluster_to_numeric(team_cluster["ELO"]))

text(s3d.coords$x,s3d.coords$y,
     labels=team_cluster$TEAM,
     pos=4, cex=.6)

