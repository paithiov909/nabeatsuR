#' @noRd
#' @keywords internal
strzl_which_impl <- function(x, y) {
  which(nb_detect_cpp(x, y))
}

#' Find matcing indices
#'
#' Equvalent to `grep(pattern, string)`.
#'
#' @param string Character vector.
#' @param pattern String scalar; pattern to look for.
#' @return Integers.
#' @export
strzl_which <- function(string, pattern) {
  if (any(!stringi::stri_enc_isascii(c(string, pattern)))) {
    rlang::abort("Non-ascii chars are not supported.")
  }
  string[is.na(string)] <- ""

  strzl_which_impl(string, pattern[1])
}
