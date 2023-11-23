// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion  It is a compile-time error if any two of the values are equal
/// according to ==.
///
/// @description Checks that it is a compile-time error if any two of the values
/// are equal according to ==.
/// @author sgrekhov@unipro.ru

main() {
  var v1 = const {1, 2 + 1, 3 - 1, 1};
//         ^
// [cfe] Constant evaluation error:
//                                 ^
// [analyzer] COMPILE_TIME_ERROR.EQUAL_ELEMENTS_IN_CONST_SET
  const v2 = {1, 2 + 1, 3 - 1, 1, };
//           ^
// [cfe] Constant evaluation error:
//                             ^
// [analyzer] COMPILE_TIME_ERROR.EQUAL_ELEMENTS_IN_CONST_SET
  var v3 = const <int>{1 + 1, 2 + 1, 3 - 1, 1, };
//         ^
// [cfe] Constant evaluation error:
//                                   ^^^^^
// [analyzer] COMPILE_TIME_ERROR.EQUAL_ELEMENTS_IN_CONST_SET

  const v4 = {null, null};
//           ^
// [cfe] Constant evaluation error:
//                  ^^^^
// [analyzer] COMPILE_TIME_ERROR.EQUAL_ELEMENTS_IN_CONST_SET
  var v5 = const {null, null};
//         ^
// [cfe] Constant evaluation error:
//                      ^^^^
// [analyzer] COMPILE_TIME_ERROR.EQUAL_ELEMENTS_IN_CONST_SET
  var v6 = const <int?>{null, null};
//         ^
// [cfe] Constant evaluation error:
//                            ^^^^
// [analyzer] COMPILE_TIME_ERROR.EQUAL_ELEMENTS_IN_CONST_SET

  const v7 = {'1', '2' + '1', "3 - 1", "1",};
//           ^
// [cfe] Constant evaluation error:
//                                     ^^^
// [analyzer] COMPILE_TIME_ERROR.EQUAL_ELEMENTS_IN_CONST_SET
  const v8 = {'1', '2' + '1', "3 - 1", true, 1 == 1};
//           ^
// [cfe] Constant evaluation error:
//                                           ^^^^^^
// [analyzer] COMPILE_TIME_ERROR.EQUAL_ELEMENTS_IN_CONST_SET
  var v9 = const {'1', '2' + '1', "3 - 1", true, 1 == 1};
//         ^
// [cfe] Constant evaluation error:
//                                               ^^^^^^
// [analyzer] COMPILE_TIME_ERROR.EQUAL_ELEMENTS_IN_CONST_SET
}
