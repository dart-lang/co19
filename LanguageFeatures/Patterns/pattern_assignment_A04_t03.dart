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
/// ...
/// In a pattern assignment, all variable patterns are interpreted as referring
/// to existing variables. You can't declare any new variables.
///
/// @description Check that it is a compile-time error if a pattern assignment
/// declares any variable. Test a map pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

main() {
  int a = -1, b = -2;
  {"key1": var a, "key2": _} = {"key1": 1, "key2": 2};
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified

  {"key1": int a, "key2": _, ...} = {"key1": 1, "key2": 2, "key3": 3};
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified

  {"key1": final a, "key2": _} = {"key1": 1, "key2": 2};
//         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  {"key1": a, "key2": var b1} = {"key1": 1, "key2": 2};
//                    ^^^
// [analyzer] unspecified
// [cfe] unspecified

  {"key1": a, "key2": int b1, ...} = {"key1": 1, "key2": 2, "key3": 3};
//                    ^^^
// [analyzer] unspecified
// [cfe] unspecified

  {"key1": a, "key2": final b3} = {"key1": 1, "key2": 2};
//                    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  {"key1": const a, "key2": b, ...} = {"key1": 1, "key2": 2, "key3": 3};
//         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  {"key1": a, "key2": const b4} = {"key1": 1, "key2": 2};
//                    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
