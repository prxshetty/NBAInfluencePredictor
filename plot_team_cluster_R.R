# Ensure the readr package is loaded
#install.packages("ggplot2")
#install.packages("readr")
#install.packages("scatterplot3d")
library(scatterplot3d)
library(readr)

team_cluster <- read_csv("D:/ML Projects/NBAInfluencePredictor/data/nba_2017_att_val_elo_win_housing_cluster.csv", col_types = cols(X1 = col_skip()))
print(head(team_cluster))
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
library("ggplot2")

# Assigning names to clusters
team_cluster$cluster_name[team_cluster$cluster == 0] <- "Low"
team_cluster$cluster_name[team_cluster$cluster == 1] <- "Medium Valuation/High Performance"
team_cluster$cluster_name[team_cluster$cluster == 2] <- "High Valuation/Low Performance"


p <- ggplot(data=team_cluster) +
  geom_point(mapping = aes(x = ELO, y = VALUE_MILLIONS, color = factor(WINNING_SEASON, labels=c("LOSING", "WINNING")),
                           size = MEDIAN_HOME_PRICE_COUNTY_MILLIONS, shape = CONF)) +
  facet_wrap(~cluster_name) +
  ggtitle("NBA Teams 2016-2017 Faceted Plot") +
  ylab("Value NBA Team in Millions") +
  xlab("Relative Team Performance (ELO)") +
  geom_text(aes(x = ELO, y = VALUE_MILLIONS, label=ifelse(VALUE_MILLIONS > 1200, as.character(TEAM), '')),
            hjust=0.35, vjust=1)  

print(p)
