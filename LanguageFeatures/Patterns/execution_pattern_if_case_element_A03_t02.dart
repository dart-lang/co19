// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If-case element
/// 1. Evaluate the expression producing v.
/// 2. Match the pattern in the guardedPattern against v.
/// 3. If the match succeeds:
///   i. If there is a guard clause:
///     a. Evaluate it. If it does not evaluate to a bool, throw a runtime error
///     b. If the guard evaluates to true, evaluate the then element and yield
///       the result into the collection.
///     c. Else, evaluate the else element if there is one and yield the result
///       into the collection.
///   ii. Else there is no guard clause. Evaluate the then element and yield the
///     result into the collection.
/// 4. Else the match failed. Evaluate the else element if there is one and
///   yield the result into the collection.
///
/// @description Check that it is a compile-time error if the value yielded by
/// pattern-if-case element is not assignable to the collection element type
/// @author sgrekhov22@gmail.com. Test a map literal

import "patterns_lib.dart";

main() {
  <String, String>{
    if (Square(2) case Square(area: const Unit(4))) "k": 1,
//                                                       ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  <String, int>{
    if (Square(2) case Square(area: const Unit(4))) "k": 1 else "k2": 2 as num
//                                                                    ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}
