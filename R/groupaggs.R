#' filter rows based on a column compared to a statistic within a group
#'
#' @param data dataset, must be a data.table
#' @param group.cols columns to group by
#' @param agg.funct function which value is calculated for the group
#' @param agg.col numerical column which value is compared to the functions value
#' @param symbol symbol of the comparison
#'
#' @return a filtered data.table object
#' @export
#'
#' @examples
#' #this returns rows of the iris set that have their Sepal.Length higher than the mean of their Species
#' iris_dt <- as.data.table(iris)
#' group.aggs(iris_dt,'Species',mean,'Sepal.Length','>')
group.aggs <- function(data,group.cols,agg.funct,agg.col,symbol){

  stopifnot('data must be a data.table' = is.data.table(data))
  stopifnot('symbol must be a relational operator' = symbol %in% getGroupMembers(Compare))

  data[data[,.I[ get(symbol)(eval(str2lang(agg.col)), agg.funct(eval(str2lang(agg.col))))],by=group.cols]$V1]

}

