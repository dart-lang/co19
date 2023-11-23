// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An entry element (the base case in maps):
///
/// It is a compile-time error if the key and value expressions are not constant
/// expressions.
///
/// As is already the case in Dart, it is a compile-time error if the key is an
/// instance of a class that implements the operator == unless the key is a
/// Boolean, string, an integer, a literal symbol or the result of invoking a
/// constant constructor of class Symbol. It is a compile-time error if the type
/// arguments of a constant map literal include a type parameter.
///
/// The expansion is the entry formed by the key and value expression values.
///
/// @description Checks that it is a compile-time error if the key or value
/// expressions are not constant expressions.
/// @author sgrekhov@unipro.ru


main() {
  var x = 1;
  var y = "y";
  Map<int, String> map1 = const {if (1 > 0) x: "1"};
//                                          ^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_MAP_KEY
// [cfe] Not a constant expression.
  Map<int, String> map2 = const {if (1 > 0) 1: y};
//                                             ^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_MAP_VALUE
// [cfe] Not a constant expression.
  const Map<int, String> map3 = {if (1 > 0) x: "x"};
//                                          ^
// [analyzer] unspecified
// [cfe] unspecified
  const Map<int, String> map4 = {if (1 > 0) 1: y};
//                                             ^
// [analyzer] unspecified
// [cfe] unspecified
  var map5 = const {if (1 > 0) x: "x"};
//                             ^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_MAP_KEY
// [cfe] Not a constant expression.
  var map6 = const {if (1 > 0) 1: y};
//                                ^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_MAP_VALUE
// [cfe] Not a constant expression.
  var map7 = const <int, String>{if (1 > 0) x: "x"};
//                                          ^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_MAP_KEY
// [cfe] Not a constant expression.
  var map8 = const <int, String>{if (1 > 0) 1: y};
//                                             ^
// [analyzer] COMPILE_TIME_ERROR.NON_CONSTANT_MAP_VALUE
// [cfe] Not a constant expression.
  const map9 = {if (1 > 0) x: "x" };
//                         ^
// [analyzer] unspecified
// [cfe] unspecified
  const map10 = {if (1 > 0) -1: y };
//                              ^
// [analyzer] unspecified
// [cfe] unspecified
}
