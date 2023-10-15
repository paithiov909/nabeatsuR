#' Detect digit that should be read as 'Aho'
#'
#' Detect whether the integers are multiples of `d` or
#' numbers where `d` is used as one of the digits.
#'
#' @inheritParams should_be_aho
#' @return Logicals.
#' @export
detect_digit1 <- function(x, d = 3,
                          engine = c("base", "stringi", "stringzilla")) {
  engine <- rlang::arg_match(engine)
  switch(engine,
    "base" = detect_digit1_base(x, d),
    "stringi" = detect_digit1_stringi(x, d),
    "stringzilla" = detect_digit1_stringzilla(x, d)
  )
}

#' @noRd
detect_digit1_base <- function(x, d = 3) {
  target <- as.character(d[1])
  x %% d[1] == 0 | grepl(target, x, fixed = TRUE)
}

#' @noRd
detect_digit1_stringi <- function(x, d = 3) {
  target <- as.character(d[1])
  x %% d[1] == 0 | stri_detect_fixed(x, target)
}

#' @noRd
detect_digit1_stringzilla <- function(x, d = 3) {
  target <- as.character(d[1])
  x %% d[1] == 0 | nb_detect_cpp(as.character(x), target)
}
