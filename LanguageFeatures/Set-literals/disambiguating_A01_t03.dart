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
/// @description Checks that it is a compile-time error if an
/// emptySetOrMapLiteral has a typeArguments with more than two type arguments.
/// @author sgrekhov@unipro.ru

var v1 = <int, String, Object> {};
//       ^^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.EXPECTED_TWO_MAP_TYPE_ARGUMENTS
// [cfe] A set or map literal requires exactly one or two type arguments, respectively.
var v2 = const <int, String, Object> {};
//             ^^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.EXPECTED_TWO_MAP_TYPE_ARGUMENTS
// [cfe] A set or map literal requires exactly one or two type arguments, respectively.

main() {
  var x1 = <int, String, Object> {};
//         ^^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.EXPECTED_TWO_MAP_TYPE_ARGUMENTS
// [cfe] A set or map literal requires exactly one or two type arguments, respectively.
  var x2 = const <int, String, Object> {};
//               ^^^^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.EXPECTED_TWO_MAP_TYPE_ARGUMENTS
// [cfe] A set or map literal requires exactly one or two type arguments, respectively.
}
