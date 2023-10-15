#' Count number of matches
#'
#' Counts the number of times `pattern` is found
#' within each element of `string`.
#'
#' @param string Character vector.
#' @param pattern String scalar. Unlike `stringr::str_count`,
#' `pattern` must be a single string.　The second and subsequent strings are ignored.
#' @param .na If `TRUE`, returns `NA` for an `NA` string.
#' @return Integers.
#' @export
strzl_count <- function(string, pattern, .na = FALSE) {
  if (any(!stringi::stri_enc_isascii(c(string, pattern)))) {
    rlang::abort("Non-ascii chars are not supported.")
  }
  ret <- nb_count_cpp(string, substr(pattern[1], 1, 1))

  if (!.na) {
    return(ret)
  }
  ret[is.na(string)] <- NA
  ret
}
