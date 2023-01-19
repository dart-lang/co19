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
/// It is a compile-time error if:
/// ...
/// The same variable is assigned more than once.
///
/// @description Check that it is a compile-time error if the same variable is
/// assigned more than once.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

main() {
  var a = 42;
  Record r = ();
  List<int> l = [];
  int areaAsInt = 42;
  dynamic d = 0;

  ((a, a) && r) = (1, 2);
//     ^
// [analyzer] unspecified
// [cfe] unspecified

  ((a, _) && r && r) = (1, 2);
//                ^
// [analyzer] unspecified
// [cfe] unspecified

  [a, a, _] = [1, 2, 3];
//    ^
// [analyzer] unspecified
// [cfe] unspecified

  [a, d, ...d] = [1, 2, 3, 4];
//          ^
// [analyzer] unspecified
// [cfe] unspecified

  {"key1": a, "key2": a} = {"key1": "one", "key2": 2};
//                    ^
// [analyzer] unspecified
// [cfe] unspecified

  {"key1": a, "key2": a, ...} = {"key1": "one", "key2": 2, "key3": 3};
//                    ^
// [analyzer] unspecified
// [cfe] unspecified

  (a, a)  = (1, 2);
//    ^
// [analyzer] unspecified
// [cfe] unspecified

  (n1: a, n2: a)  = (n1: 1, n2: 2);
//            ^
// [analyzer] unspecified
// [cfe] unspecified

  (:a, a)  = (a: 1, 2);
//  ^
// [analyzer] unspecified
// [cfe] unspecified

  Square(areaAsInt: a, sizeAsInt: a) = Square(1);
//                                ^
// [analyzer] unspecified
// [cfe] unspecified

  Square(:areaAsInt, :areaAsInt) = Square(1);
//        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
