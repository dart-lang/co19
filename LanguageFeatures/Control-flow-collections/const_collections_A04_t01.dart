// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An if element:
/// ...
/// It is a compile-time error if the then and else branches are not potentially
/// const expressions. The "potentially const" is to allow a the unchosen branch
/// to throw an exception. In other words, if elements short-circuit.
///
/// @description Checks that it is a compile-time error if the then and else
/// branches are not potentially const expressions.
/// @author sgrekhov@unipro.ru

main() {
  const t = true;
  var x = 1;
  List<int> list1 = const [if (t) x else 1 ];
//                                ^
// [analyzer] unspecified
// [cfe] unspecified
  const List<int> list2 = [if (!t) 1 else x ];
//                                        ^
// [analyzer] unspecified
// [cfe] unspecified
  var list3 = const [if (t) x else 1, ];
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
  var list4 = const <int>[if (!t) 1 else x, ];
//                                       ^
// [analyzer] unspecified
// [cfe] unspecified
  const list5 = [if (t) 1 else x ];
//                             ^
// [analyzer] unspecified
// [cfe] unspecified

  Set<int> set1 = const {if (t) x else 1, -1 };
//                              ^
// [analyzer] unspecified
// [cfe] unspecified
  const Set<int> set2 = {if (!t) 1 else x, -1 };
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified
  var set3 = const {if (t) x else 1, -1, };
//                         ^
// [analyzer] unspecified
// [cfe] unspecified
  var set4 = const <int>{if (!t) 1 else x, -1, };
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified
  const set5 = {if (!t) 1 else x, -1 };
//                             ^
// [analyzer] unspecified
// [cfe] unspecified

  Map<int, String> map1 = const {if (!t) 1: "1" else x: "1"};
//                                                   ^
// [analyzer] unspecified
// [cfe] unspecified
  const Map<int, String> map2 = {if (t) x: "x" else 1: "x"};
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified
  var map3 = const {if (!t) 1: "x" else x: "x"};
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified
  var map4 = const <int, String>{if (!t) 1: "x" else x: "x"};
//                                                   ^
// [analyzer] unspecified
// [cfe] unspecified
  const map5 = {if (!t) 1: "x" else x: "x"};
//                                  ^
// [analyzer] unspecified
// [cfe] unspecified
}
