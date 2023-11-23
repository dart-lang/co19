// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a static error if:
///    A spread element in a list or set literal has a static type that is not
///    assignable to Iterable<Object>.
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
// [analyzer] COMPILE_TIME_ERROR.NOT_ITERABLE_SPREAD
// [cfe] Unexpected type 'int' of a spread.  Expected 'dynamic' or an Iterable.
  List l2 = [...str];
//              ^^^
// [analyzer] COMPILE_TIME_ERROR.NOT_ITERABLE_SPREAD
// [cfe] Unexpected type 'String' of a spread.  Expected 'dynamic' or an Iterable.
  List l3 = [...map];
//              ^^^
// [analyzer] COMPILE_TIME_ERROR.NOT_ITERABLE_SPREAD
// [cfe] Unexpected type 'Map<int, int>' of a spread.  Expected 'dynamic' or an Iterable.
  List l4 = [...list[0]];
//              ^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.NOT_ITERABLE_SPREAD
//                  ^
// [cfe] Unexpected type 'int' of a spread.  Expected 'dynamic' or an Iterable.

  List l5 = [...?(number as int?)];
//               ^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.NOT_ITERABLE_SPREAD
//                       ^
// [cfe] Unexpected type 'int?' of a spread.  Expected 'dynamic' or an Iterable.
  List l6 = [...?(str as String?)];
//               ^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.NOT_ITERABLE_SPREAD
//                    ^
// [cfe] Unexpected type 'String?' of a spread.  Expected 'dynamic' or an Iterable.
  List l7 = [...?(map as Map?)];
//               ^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.NOT_ITERABLE_SPREAD
//                    ^
// [cfe] Unexpected type 'Map<dynamic, dynamic>?' of a spread.  Expected 'dynamic' or an Iterable.
  List l8 = [...?list[0]];
//               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
