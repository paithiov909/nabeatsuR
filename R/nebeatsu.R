## usethis namespace: start
#' @useDynLib nabeatsuR, .registration = TRUE
#' @importFrom stringi stri_detect_fixed
## usethis namespace: end
"_PACKAGE"

#' Detect digit that should be said as 'Aho'
#'
#' This function is for '3' only.
#' The arguments `d` and `engine` are not used in this function.
#'
#' @param x Integers.
#' @param d Integer scalar; a digit to be detected.
#' @param engine One of 'base', 'stringr', or 'stringzilla'.
#' @return Logicals.
#' @export
should_be_aho <- function(x, d = 3, engine = NULL) {
  strsplit(as.character(x), "", fixed = TRUE) |>
    lapply(function(v) {
      Reduce(function(cur, acc) {
        (cur + as.integer(acc)) %% 3
      }, v, init = 0, accumulate = FALSE)
    }) |>
    unlist() == 0 | grepl(as.character(d[1]), x, fixed = TRUE)
}
