#' Detect the presence of a match
#'
#' Equivalent to `gerpl(pattern, string)`.
#'
#' @param string Character vector.
#' @param pattern String scalar; pattern to look for.
#' @param .na If `TRUE`, returns `NA` for an `NA` string.
#' @return Logicals.
#' @export
strzl_detect <- function(string, pattern, .na = FALSE) {
  if (any(!stringi::stri_enc_isascii(c(string, pattern)))) {
    rlang::abort("Non-ascii chars are not supported.")
  }
  ret <- nb_detect_cpp(string, pattern[1])

  if (!.na) {
    return(ret)
  }
  ret[is.na(string)] <- NA
  ret
}
