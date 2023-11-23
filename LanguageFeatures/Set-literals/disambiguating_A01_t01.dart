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
/// @description Checks that it is a compile-time error if a mapLiteral has a
/// typeArguments with a number of type arguments other than two.
/// @author sgrekhov@unipro.ru

Map map1 = {"1" :1, "2": 2};
Map map2 = {};

Map v1 = <int> {};
//       ^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
//             ^
// [cfe] A value of type 'Set<int>' can't be assigned to a variable of type 'Map<dynamic, dynamic>'.
Map v2 = const <String> {};
//       ^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] A value of type 'Set<String>' can't be assigned to a variable of type 'Map<dynamic, dynamic>'.
var v3 = <int> {1: 2};
//              ^^^^
// [analyzer] COMPILE_TIME_ERROR.MAP_ENTRY_NOT_IN_MAP
//               ^
// [cfe] Expected ',' before this.
var v4 = const <String?> {'s': null};
//                        ^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.MAP_ENTRY_NOT_IN_MAP
//                           ^
// [cfe] Expected ',' before this.
var v5 = const <String, int?, int?> {'s': null};
//             ^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.EXPECTED_TWO_MAP_TYPE_ARGUMENTS
// [cfe] A set or map literal requires exactly one or two type arguments, respectively.
var v6 = <String, int?, int?> {'s': null};
//       ^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.EXPECTED_TWO_MAP_TYPE_ARGUMENTS
// [cfe] A set or map literal requires exactly one or two type arguments, respectively.
var v7 = <String, int, int> {};
//       ^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.EXPECTED_TWO_MAP_TYPE_ARGUMENTS
// [cfe] A set or map literal requires exactly one or two type arguments, respectively.
var v8 = <String, int, int> {};
//       ^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.EXPECTED_TWO_MAP_TYPE_ARGUMENTS
// [cfe] A set or map literal requires exactly one or two type arguments, respectively.
var v9 = <String, int, int> {...map1};
//       ^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.EXPECTED_TWO_MAP_TYPE_ARGUMENTS
// [cfe] A set or map literal requires exactly one or two type arguments, respectively.
var v10 = <String, int, int> {...map2};
//        ^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.EXPECTED_TWO_MAP_TYPE_ARGUMENTS
// [cfe] A set or map literal requires exactly one or two type arguments, respectively.

main() {
  Map x1 = <int> {};
//         ^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
//               ^
// [cfe] A value of type 'Set<int>' can't be assigned to a variable of type 'Map<dynamic, dynamic>'.
  Map x2 = const <String> {};
//         ^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] A value of type 'Set<String>' can't be assigned to a variable of type 'Map<dynamic, dynamic>'.
  var x3 = <int> {1: 2};
//                ^^^^
// [analyzer] COMPILE_TIME_ERROR.MAP_ENTRY_NOT_IN_MAP
//                 ^
// [cfe] Expected ',' before this.
  var x4 = const <String?> {'s': null};
//                          ^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.MAP_ENTRY_NOT_IN_MAP
//                             ^
// [cfe] Expected ',' before this.
  var x5 = const <String, int?, int?> {'s': null};
//               ^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.EXPECTED_TWO_MAP_TYPE_ARGUMENTS
// [cfe] A set or map literal requires exactly one or two type arguments, respectively.
  var x6 = <String, int?, int?> {'s': null};
//         ^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.EXPECTED_TWO_MAP_TYPE_ARGUMENTS
// [cfe] A set or map literal requires exactly one or two type arguments, respectively.
  var x7 = <String, int, int> {};
//         ^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.EXPECTED_TWO_MAP_TYPE_ARGUMENTS
// [cfe] A set or map literal requires exactly one or two type arguments, respectively.
  var x8 = <String, int, int> {};
//         ^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.EXPECTED_TWO_MAP_TYPE_ARGUMENTS
// [cfe] A set or map literal requires exactly one or two type arguments, respectively.
  var x9 = <String, int, int> {...map};
//         ^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var x10 = <String, int, int> {...map2};
//          ^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.EXPECTED_TWO_MAP_TYPE_ARGUMENTS
// [cfe] A set or map literal requires exactly one or two type arguments, respectively.
}
