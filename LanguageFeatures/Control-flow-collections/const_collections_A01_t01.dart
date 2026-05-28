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
// [analyzer] unspecified
// [cfe] unspecified
  const List<int> list2 = [if (1 > 0) x, 1 ];
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified
  var list3 = const [if (1 > 0) x, 1, ];
//                              ^
// [analyzer] unspecified
// [cfe] unspecified
  var list4 = const <int>[if (1 > 0) x, 1, ];
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified
  const list5 = [if (1 > 0) x, 1 ];
//                          ^
// [analyzer] unspecified
// [cfe] unspecified

  Set<int> set1 = const {if (1 > 0) x, -1 };
//                                  ^
// [analyzer] unspecified
// [cfe] unspecified
  const Set<int> set2 = {if (1 > 0) x, -1 };
//                                  ^
// [analyzer] unspecified
// [cfe] unspecified
  var set3 = const {if (1 > 0) x, -1, };
//                             ^
// [analyzer] unspecified
// [cfe] unspecified
  var set4 = const <int>{if (1 > 0) x, -1, };
//                                  ^
// [analyzer] unspecified
// [cfe] unspecified
  const set5 = {if (1 > 0) x, -1 };
//                         ^
// [analyzer] unspecified
// [cfe] unspecified
}
