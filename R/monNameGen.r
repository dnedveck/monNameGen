create_sample <- function(n, data, regex) {
  sample(
    if (!is.null(regex)) 
      data[grepl(regex, data, ignore.case = TRUE)]
    else
      data, 
    n, 
    replace = TRUE
  )
}

#' Monster Name Generator
#' 
#' Create a random monster name in the style of Diablo II. Stock for potential
#' permutations provided by
#' \url{http://diablo.gamepedia.com/Unique_Monsters_(Diablo_II)}.
#'
#' @param n Number of monster names to return.
#' @param filters A named list with regular expressions to filter out
#'   possibilities. The list must contain a combination of zero or more of the
#'   following character vectors with valid regular expressions: \code{prefix},
#'   \code{suffix}, \code{appelation}.
#' @examples
#' monNameGen(10)
#' monNameGen(10, list(prefix= "Star", appelation = "Shade"))
#' monNameGen(10, list(suffix = "^Kill"))
#' @author Derek Nedveck and Paul Egeler
#' @export

monNameGen <- function(
  n = 1, 
  filters = list()
  ){
  pre <- create_sample(n, .monNameGenData$prefix, filters$prefix)
  suf <- create_sample(n, .monNameGenData$suffix, filters$suffix)
  app <- create_sample(n, .monNameGenData$appel, filters$appelation)
  
  paste0(pre, suf, " the ", app)
}
