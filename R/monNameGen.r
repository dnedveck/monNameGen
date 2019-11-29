create_sample <- function(n, data, subst, regex) {
  # first subset the data
  # relying on the integer column being coerced into logical
  data <- data[ 
    data[["DII"]] & "DII" %in% subst |
      data[["non-canon"]] & "non-canon" %in% subst, 1
    ]
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
#' @param nameset A character vector denoting the sets of names to pull from.
#'  - "DII" = canon names 
#'  - "non-canon" = names added that fit into the brutal naming theme, but are not canon DII or DIII names
#'  
#' @examples
#' monNameGen(10)
#' monNameGen(10, list(prefix= "Star", appelation = "Shade"))
#' monNameGen(10, list(suffix = "^Kill"))
#' @author Derek Nedveck and Paul Egeler
#' @export

monNameGen <- function(
  n = 1, 
  filters = list(),
  nameset = c("DII", "non-canon")
  ){
  
  pre <- create_sample(n, name_tables$prefix, nameset, filters$prefix)
  suf <- create_sample(n, name_tables$suffix, nameset, filters$suffix)
  app <- create_sample(n, name_tables$appelation, nameset, filters$appelation)
  
  paste0(pre, suf, " the ", app)
}
