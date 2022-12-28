// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A pattern on the left side of an assignment expression is used to
/// destructure the assigned value. We extend expression:
///
/// expression        ::= patternAssignment
///                     | // Existing productions...
///
/// patternAssignment ::= outerPattern '=' expression
///
/// This syntax allows chaining pattern assignments and mixing them with other
/// assignments, but does not allow patterns to the left of a compound
/// assignment operator.
///
/// @description Check that it is a compile-time error if a pattern patterns is
/// the left side of a compound assignment operator.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

main() {
  int a1 = 42;
  Record r1 = ();
  ((a1, _) && r1) ??= (1, 2);
//^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  int a2 = 3;
  [a2, _] ??= [1, 2];
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var a3 = 42;
  {"key1": a3, "key2": _} ??= {"key1": 1, "key2": 2};
//^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var a4 = 3;
  (a4, _) ??= (1, 2);
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  int a5 = 3;
  Square(areaAsInt: a5, sizeAsInt: _) ??= Square(1);
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
