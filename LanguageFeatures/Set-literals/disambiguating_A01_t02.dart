// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let e be a setOrMapLiteral
/// ...
/// If e has typeArguments then:
///   - If there is exactly one type argument T, then e is a set literal with
///     static type Set<T>.
///   - If there are exactly two type arguments K and V, then e is a map literal
///     with static type Map<K, V>.
///   - Otherwise (three or more type arguments), report a compile-time error.
///
/// @description Checks that it is a compile-time error if a setLiteral has a
/// typeArguments with more than one type argument.
/// @author sgrekhov@unipro.ru

Set set1 = {1, 2};
Set set2 = {};

var v1 = <int, String> {1};
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
var v2 = const <String, int> {1, 2};
//                            ^
// [analyzer] unspecified
// [cfe] unspecified
var v3 = <String, int> {'1', '2'};
//                      ^^^
// [analyzer] unspecified
// [cfe] unspecified
var v4 = const <int?, String?> {'s', null};
//                              ^^^
// [analyzer] unspecified
// [cfe] unspecified
var v5 = <String, int> {...set1};
//                         ^^^^
// [analyzer] COMPILE_TIME_ERROR.NOT_MAP_SPREAD
// [cfe] Unexpected type 'Set<dynamic>' of a map spread entry.  Expected 'dynamic' or a Map.
var v6 = const <int, String> {...set2};
//                               ^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  var x1 = <int, String> {1};
//                        ^
// [analyzer] unspecified
// [cfe] unspecified
  var x2 = const <String, int> {1, 2};
//                              ^
// [analyzer] unspecified
// [cfe] unspecified
  var x3 = <String, int> {'1', '2'};
//                        ^^^
// [analyzer] unspecified
// [cfe] unspecified
  var x4 = const <int?, String?> {'s', null};
//                                ^^^
// [analyzer] unspecified
// [cfe] unspecified
  var x5 = <String, int> {...set1};
//                           ^^^^
// [analyzer] COMPILE_TIME_ERROR.NOT_MAP_SPREAD
// [cfe] Unexpected type 'Set<dynamic>' of a map spread entry.  Expected 'dynamic' or a Map.
  var x6 = const <int, String> {...set2};
//                                 ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
