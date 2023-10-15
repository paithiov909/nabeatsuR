// #include <RcppThread.h>
#include <Rcpp.h>
#include "stringzilla.h"

//' @noRd
// [[Rcpp::export]]
std::vector<bool> nb_detect_cpp(std::vector<std::string> x, std::string y) {
  std::size_t n = x.size();
  std::vector<bool> out(n);

  const char* pat = y.c_str();
  sz_string_view_t needle = {pat, strlen(pat)};

  for(std::size_t i = 0; i < n; i++) {
    const char* buf = x[i].c_str();
    sz_string_view_t haystack = {buf, strlen(buf)};
    sz_string_start_t ptr =
     sz_find_substring(haystack.start, haystack.length, needle.start, needle.length);
    out[i] = ptr ? true : false;
  }

  return out;
}

// std::vector<bool> thread_detect_cpp(std::vector<std::string> x, std::string y) {
//   std::size_t n = x.size();
//   std::vector<bool> out(n);
//
//   const char* pat = y.c_str();
//   sz_string_view_t needle = {pat, strlen(pat)};
//
//   RcppThread::parallelFor(0, n, [&](std::size_t i) {
//     const char* buf = x[i].c_str();
//     sz_string_view_t haystack = {buf, strlen(buf)};
//     sz_string_start_t ptr =
//       sz_find_substring(haystack.start, haystack.length, needle.start, needle.length);
//     out[i] = ptr ? true : false;
//   });
//
//   return out;
// }

//' @noRd
// [[Rcpp::export]]
std::vector<int> nb_count_cpp(std::vector<std::string> x, std::string y) {
  std::size_t n = x.size();
  std::vector<int> out(n);

  const char* pat = y.c_str();
  sz_string_view_t needle = {pat, strlen(pat)};

  for(std::size_t i = 0; i < n; i++) {
    const char* buf = x[i].c_str();
    sz_string_view_t haystack = {buf, strlen(buf)};
    sz_size_t count =
      sz_count_char(haystack.start, haystack.length, needle.start);
    out[i] = (int) count;
  }

  return out;
}

// std::vector<int> thread_count_cpp(std::vector<std::string> x, std::string y) {
//   std::size_t n = x.size();
//   std::vector<int> out(n);
//
//   const char* pat = y.c_str();
//   sz_string_view_t needle = {pat, strlen(pat)};
//
//   RcppThread::parallelFor(0, n, [&](std::size_t i) {
//     const char* buf = x[i].c_str();
//     sz_string_view_t haystack = {buf, strlen(buf)};
//     sz_size_t count =
//       sz_count_char(haystack.start, haystack.length, needle.start);
//     out[i] = (int) count;
//   });
//
//   return out;
// }
