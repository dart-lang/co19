// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a static error if:
///    A spread element in a list or set literal has a static type that is not
///    assignable to Iterable<Object>.
///
/// @description Checks that compile error is thrown if spread element in list
/// literal is not assignable to [Iterate<Object>]
/// @author iarkh@unipro.ru

main() {
  var number = 1;
  var str = "checkme";
  var map = {1: 1, 2: 2};
  var list = [1, 2, 3, 4, 5];

  List l1 = [...number];
//              ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  List l2 = [...str];
//              ^^^
// [analyzer] unspecified
// [cfe] unspecified
  List l3 = [...map];
//              ^^^
// [analyzer] unspecified
// [cfe] unspecified
  List l4 = [...list[0]];
//              ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  List l5 = [...?(number as int?)];
//               ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  List l6 = [...?(str as String?)];
//               ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  List l7 = [...?(map as Map?)];
//               ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  List l8 = [...?list[0]]; // ignore: invalid_null_aware_operator
//               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
