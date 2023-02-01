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
  var ((n1, s1) && r1) = (1, "str"), [a1, b1] = [1, 2];
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified

  final [a2, _, ...] = [1, 2, 3, 4], {"pi": a3} = {"pi": 3.14};
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified

  var {"pi": a4, ...} = {"pi": 3.14, "e": 2.71}, (n2, s2) = (1, "str");
//                                             ^
// [analyzer] unspecified
// [cfe] unspecified

  final  Square(areaAsInt: n5) = Square(1), (n4, name: s4) = (3.14, name: "pi");
//                                        ^
// [analyzer] unspecified
// [cfe] unspecified

  var (value: n5, name: s5) = (value: 3.14, name: "pi"), (n3,) = (1,);
//                                                     ^
// [analyzer] unspecified
// [cfe] unspecified

  final Square(areaAsInt: n6) = Square(1), Square(areaAsInt: n7) = Square(2);
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified
}
