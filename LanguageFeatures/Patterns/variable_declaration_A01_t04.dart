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
/// declarations are comma-separated
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

main() {
  var [a1, _] = [1, 2], c1 = 42;
//                    ^
// [analyzer] unspecified
// [cfe] unspecified

  final [a2, b2, ...] = [1, 2, 3, 4],  c2 = 42;
//                                  ^
// [analyzer] unspecified
// [cfe] unspecified

  var {"pi": a3} = {"pi": 3.14, "e": 2.71}, c3 = 42;
//                                        ^
// [analyzer] unspecified
// [cfe] unspecified

  final {"pi": a4, "e": _} = {"pi": 3.14, "e": 2.71}, c4 = 42;
//                                                  ^
// [analyzer] unspecified
// [cfe] unspecified

  var (n5, name: s5) = (3.14, name: "pi"), c5 = 42;
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified

  final Square(areaAsInt: n6) = Square(1), c6 = 42;
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified

  var  Square(areaAsInt: n7, area: _) = Square(1), c7 = 42;
//                                               ^
// [analyzer] unspecified
// [cfe] unspecified

  final ((n8,) && r8) = (1,), c8 = 42;
//                          ^
// [analyzer] unspecified
// [cfe] unspecified

  var ((n9,) && _) = (1,), c9 = 42;
//                        ^
// [analyzer] unspecified
// [cfe] unspecified

  var c10 = 42, ((n10,) && _) = (1,);
//            ^
// [analyzer] unspecified
// [cfe] unspecified
}
