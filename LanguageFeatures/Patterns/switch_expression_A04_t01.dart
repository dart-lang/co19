// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Expression statement ambiguity
///
/// Thanks to expression statements, a switch expression could appear in the
/// same position as a switch statement. This isn't technically ambiguous, but
/// requires unbounded lookahead to read past the value expression to the first
/// case in order to tell if a switch in statement position is a statement or
/// expression.
///
/// main() {
///   switch (some(extremely, long, expression, here)) {
///     _ => expression()
///   };
///
///   switch (some(extremely, long, expression, here)) {
///     case _: statement();
///   }
/// }
/// To avoid that, we disallow a switch expression from appearing at the
/// beginning of an expression statement. This is similar to existing
/// restrictions on map literals appearing in expression statements. In the rare
/// case where a user really wants one there, they can parenthesize it.
///
/// @description Check that it is a compile-time error if a switch expression
/// appears at the beginning of an expression statement
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

void test(String s) {
  switch (s) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    "one" => 1,
    _ => 0
  };
}

main() {
  String s = "";
  switch (s) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    "one" => 1,
    _ => 0
  };
}
