// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Point<T> operator +(Point<T> other)
/// @description Checks that arguments cannot be null
/// @author sgrekhov@unipro.ru

import "dart:math";

main() {
  new Point(0, 0) + new Point(1, null);
//                               ^^^^
// [analyzer] COMPILE_TIME_ERROR.ARGUMENT_TYPE_NOT_ASSIGNABLE
// [cfe] The value 'null' can't be assigned to the parameter type 'int' because 'int' is not nullable.
  new Point(0, 0) + new Point(null, 1);
//                            ^^^^
// [analyzer] COMPILE_TIME_ERROR.ARGUMENT_TYPE_NOT_ASSIGNABLE
// [cfe] The value 'null' can't be assigned to the parameter type 'int' because 'int' is not nullable.
  new Point(0, null) + new Point(1, 1);
//    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new Point(null, 0) + new Point(1, 1);
//    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
