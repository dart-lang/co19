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
/// declaration is not started with 'var' or `final`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

main() {
  (int, String) ((n1, _) && r1) = (1, "str");
//              ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  List<int> [a1, b1] = [1, 2];
//          ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  List<int> [a2, _, ...] = [1, 2, 3, 4];
//          ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Map<String, num> {"pi": a3, "e": _} = {"pi": 3.14, "e": 2.71};
//                 ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Map<String, num> {"pi": a4, ...} = {"pi": 3.14, "e": 2.71};
//                 ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  (int, String) (n2, _) = (1, "str");
//              ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  (int,) (n3,) = (1,);
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  (num, {String name}) (_, name: s4) = (3.14, name: "pi");
//                     ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ({String name, num value}) (value: n5, name: _) = (value: 3.14, name: "pi");
//                           ^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  int Square(areaAsInt: n5, size: _) = Square(1);
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
