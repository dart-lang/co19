// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A generic type is a type which is introduced by a generic class
/// declaration or a generic type alias, or it is the type [FutureOr].
/// @description Checks that exception is thrown if value of incorrect type is
/// assigned to [FutureOr] variable.
/// @author iarkh@unipro.ru

import "dart:async";

main() {
  FutureOr<int> x1 = "12345";
//                   ^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] A value of type 'String' can't be assigned to a variable of type 'FutureOr<int>'.
  FutureOr<String> x2 = 11;
//                      ^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] A value of type 'int' can't be assigned to a variable of type 'FutureOr<String>'.
  FutureOr<String> x3 = [1, 2, 3, 4, 5];
//                      ^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] A value of type 'List<int>' can't be assigned to a variable of type 'FutureOr<String>'.
}
