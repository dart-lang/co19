// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertionFunction expression in guard ambiguity
///
/// Function expressions also use =>, which leads to a potential ambiguity:
///
/// var x = switch (obj) {
///   _ when a + (b) => (c) => body
/// };
/// This could be interpreted as either:
///
/// var x = switch (obj) {
///   _ when (a + (b)) => ((c) => body)
///   //     ---------    -------------
/// };
///
/// var x = switch (obj) {
///   _ when (a + (b) => (c)) => (body)
///   //     ----------------    ------
/// };
/// A similar ambiguity exists with function expressions in initializer lists,
/// if the constructor happens to be a factory constructor with => for its body.
/// We resolve the ambiguity similarly here: When => is encountered after when
/// in a guard, if the code between forms a valid expression, then it is
/// interpreted as such and the => is treated as the separator between the guard
/// and case body. In the above example, we take the first interpretation.
///
/// @description Check that when `=>` is encountered after `when` in a guard,
/// if the code between forms a valid expression, then it is interpreted as such
/// and the `=>` is treated as the separator between the guard and case body
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

void foo() => 42;

main() {
  bool b = true;
  String s = "one";
  var x = switch (s) {
    "one" when (b) => (c) => c,
    _ => foo
  };
  Expect.equals(1, x(1));
}
