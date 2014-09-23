#' This will request with the prepared Query to the Google Analytics
#' Data feed API and returns the data in dataframe R object.
#'
#' @keywords internal
#'
#' @param query.uri The URI prepared by the QueryBuilder class.
#'
#' @return GA.list The Google Analytics API JSON response converted to a
#' list object
#'
#' @importFrom httr GET
GetDataFeed <- function(query.uri) {

  GA.Data <- GET(query.uri)
  GA.list <- ParseDataFeedJSON(GA.Data)
  if (is.null(GA.list$rows)) {
    stop("Your query matched 0 results. Please verify your query using the Query Feed Explorer and re-run it.")
#     GA.list$rows <- list(as.list(rep(NA, length(GA.list$columnHeaders))))
  } else {
    return (GA.list)
  }
}