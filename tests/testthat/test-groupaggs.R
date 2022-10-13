test_that("groupaggs() throws an error when data is not data.table", {
  expect_error(group.aggs(iris,'Species',mean,'Sepal.Length','>'), regexp = 'must be a data.table')
})

test_that("groupaggs() throws an error when symbol is not a valid relational operator", {
  expect_error(group.aggs(as.data.table(iris),'Species',mean,'Sepal.Length','=>'), regexp = 'must be a relational operator')
})
