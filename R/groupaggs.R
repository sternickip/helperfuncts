group.aggs <- function(data,group.cols,agg.funct,agg.col,symbol){

  stopifnot('data must be a data.table' = is.data.table(data))
  stopifnot('symbol must be a relational operator' = symbol %in% getGroupMembers(Compare))

  data[data[,.I[ get(symbol)(eval(str2lang(agg.col)), agg.funct(eval(str2lang(agg.col))))],by=group.cols]$V1]

}
#
# library(data.table)
# x <- as.data.table(iris)
# group.aggs(x,'Species',mene,'Sepal.Length','>')
#
# ?`>`
#
#
# stopifnot('data must be a data.table' = is.data.table(data))
#
# symbol <- c('==','>')
#
# stopifnot('symbol must be a relational operator' = symbol %in% getGroupMembers(Compare))
