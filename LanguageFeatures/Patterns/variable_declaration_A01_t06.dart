// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Places in the language where a local variable can be declared are
/// extended to allow a pattern, like:
///
/// var (a, [b, c]) = ("str", [1, 2]);
/// Dart's existing C-style variable declaration syntax makes it harder to
/// incorporate patterns. Variables can be declared just by writing their type,
/// and a single declaration might declare multiple variables. Fully
/// incorporating patterns into that could lead to confusing syntax like:
///
/// // Not allowed:
/// (int, String) (n, s) = (1, "str");
/// final (a, b) = (1, 2), c = 3, (d, e);
/// To avoid this weirdness, patterns only occur in variable declarations that
/// begin with a var or final keyword. Also, a variable declaration using a
/// pattern can only have a single declaration "section". No comma-separated
/// multiple declarations like:
///
/// // Not allowed:
/// var [a] = [1], (b, c) = (2, 3);
/// Declarations with patterns must have an initializer. This is not a
/// limitation since the point of using a pattern in a variable declaration is
/// to match it against the initializer's value.
///
/// @description Check that it is a compile-time error if patterns variable
/// declarations have no initializer
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

main() {
  final ((n0,) && r0), x0 = 42;
//      ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var [a1, _], x1 = 42;
//    ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final x2 = 42, [a2, b2, ...];
//               ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var x3 = 42, {"pi": a3};
//             ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final {"pi": a4}, x4 = 42;
//      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var (_, name: s5), x5 = 42;
//    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final x6 = 42, (n6,);
//               ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var x7 = 42, (name: s7);
//             ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final Square(areaAsInt: n8), x8 = 42;
//      ^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var x9 = 42, Square(sizeAsInt: n9);
//             ^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
