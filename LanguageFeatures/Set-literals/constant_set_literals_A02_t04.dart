// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if any of the values of the constant
/// element expressions override Object.operator== unless they are instances of
/// int or String, objects implementing Symbol originally created by a symbol
/// literal or a constant invocation of the Symbol constructor, or objects
/// implementing Type originally created by a constant type literal expression.
/// It is a compile-time error if any two of the values are equal according to ==
///
/// @description Checks that it is a compile-time error if any any two of the
/// values are equal according to ==
/// @author sgrekhov@unipro.ru

main() {
  var v1 = const {1, 2, 1};
//         ^
// [cfe] Constant evaluation error:
//                      ^
// [analyzer] COMPILE_TIME_ERROR.EQUAL_ELEMENTS_IN_CONST_SET
  const v2 = const {1, 2, 1};
//           ^
// [cfe] Constant evaluation error:
//                        ^
// [analyzer] COMPILE_TIME_ERROR.EQUAL_ELEMENTS_IN_CONST_SET
  const v3 = {1, 2, 1};
//           ^
// [cfe] Constant evaluation error:
//                  ^
// [analyzer] COMPILE_TIME_ERROR.EQUAL_ELEMENTS_IN_CONST_SET
  var v4 = const {1, null, null};
//         ^
// [cfe] Constant evaluation error:
//                         ^^^^
// [analyzer] COMPILE_TIME_ERROR.EQUAL_ELEMENTS_IN_CONST_SET
  const v5 = const {'a', 'b', 'c', 'a'};
//           ^
// [cfe] Constant evaluation error:
//                                 ^^^
// [analyzer] COMPILE_TIME_ERROR.EQUAL_ELEMENTS_IN_CONST_SET
  const v6 = {'a', 'b', 'c', 'a'};
//           ^
// [cfe] Constant evaluation error:
//                           ^^^
// [analyzer] COMPILE_TIME_ERROR.EQUAL_ELEMENTS_IN_CONST_SET
}
