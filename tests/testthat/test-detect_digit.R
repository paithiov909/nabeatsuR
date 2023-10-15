test_that("detect_degit works", {
  v <- seq_len(10^4)
  ans <- detect_digit1(v, engine = "base")

  expect_equal(ans, detect_digit1(v, engine = "stringi"))
  expect_equal(ans, detect_digit1(v, engine = "stringzilla"))
  expect_equal(ans, detect_digit2(v, engine = "base"))
  expect_equal(ans, detect_digit2(v, engine = "stringi"))
  expect_equal(ans, detect_digit2(v, engine = "stringzilla"))
})
