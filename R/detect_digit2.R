#' Detect digit that should be read as 'Aho'
#'
#' Detect whether the integers are multiples of `d` or
#' numbers where `d` is used as one of the digits.
#'
#' @inheritParams should_be_aho
#' @return Logicals.
#' @export
detect_digit2 <- function(x, d = 3,
                          engine = c("base", "stringi", "stringzilla")) {
  engine <- rlang::arg_match(engine)
  switch(engine,
    "base" = detect_digit2_base(x, d),
    "stringi" = detect_digit2_stringi(x, d),
    "stringzilla" = detect_digit2_stringzilla(x, d)
  )
}

#' @noRd
detect_digit2_base <- function(x, d = 3) {
  ret <- (x %% d[1] == 0)

  target <- as.character(d[1])
  aho <- grepl(target, as.character(x[!ret]), fixed = TRUE)
  ret[x %in% x[!ret][aho]] <- TRUE

  ret
}

#' @noRd
detect_digit2_stringi <- function(x, d = 3) {
  ret <- (x %% d[1] == 0)

  target <- as.character(d[1])
  aho <- stri_detect_fixed(as.character(x[!ret]), target)
  ret[x %in% x[!ret][aho]] <- TRUE

  ret
}

#' @noRd
detect_digit2_stringzilla <- function(x, d = 3) {
  ret <- (x %% d[1] == 0)

  target <- as.character(d[1])
  aho <- nb_detect_cpp(as.character(x[!ret]), target)
  ret[x %in% x[!ret][aho]] <- TRUE

  ret
}
