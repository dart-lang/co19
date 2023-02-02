// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The variables defined by a pattern and its subpatterns (its
/// pattern variable set, defined above), are introduced into a scope based on
/// where the pattern appears:
/// ...
/// Pattern assignment: An assignment only assigns to existing
/// variables and does not bind any new ones.
///
/// @description Checks that it is a compile-time error if an assignment
/// declares any new variables.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

main() {
  var a = 1;
  [a, var b1] = [2, 3];
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
  {"key1": a, "key2": final int b2} = {"key1": 2, "key2": 3};
//                    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  (a, var b3) = (2, 3);
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
  Square(areaAsInt: a, sizeAsInt: var b4) = Square(1);
//                                ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
