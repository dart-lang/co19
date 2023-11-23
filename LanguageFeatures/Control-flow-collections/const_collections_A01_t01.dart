// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An expression element (the base case in lists and sets):
///
///  It is a compile-time error if the expression is not a constant expression.
///  The expansion is the value of the expression.
///
/// @description Checks that it is a compile-time error if the expression is not
/// a constant expression
/// @author sgrekhov@unipro.ru


main() {
  var x = 1;
  List<int> list1 = const [if (1 > 0) x, 1 ];
//                                    ^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_LIST_ELEMENT
// [cfe] Not a constant expression.
  const List<int> list2 = [if (1 > 0) x, 1 ];
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified
  var list3 = const [if (1 > 0) x, 1, ];
//                              ^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_LIST_ELEMENT
// [cfe] Not a constant expression.
  var list4 = const <int>[if (1 > 0) x, 1, ];
//                                   ^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_LIST_ELEMENT
// [cfe] Not a constant expression.
  const list5 = [if (1 > 0) x, 1 ];
//                          ^
// [analyzer] unspecified
// [cfe] unspecified

  Set<int> set1 = const {if (1 > 0) x, -1 };
//                                  ^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_SET_ELEMENT
// [cfe] Not a constant expression.
  const Set<int> set2 = {if (1 > 0) x, -1 };
//                                  ^
// [analyzer] unspecified
// [cfe] unspecified
  var set3 = const {if (1 > 0) x, -1, };
//                             ^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_SET_ELEMENT
// [cfe] Not a constant expression.
  var set4 = const <int>{if (1 > 0) x, -1, };
//                                  ^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_SET_ELEMENT
// [cfe] Not a constant expression.
  const set5 = {if (1 > 0) x, -1 };
//                         ^
// [analyzer] unspecified
// [cfe] unspecified
}
