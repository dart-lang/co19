// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Point<T> operator *(num factor)
/// Scale this point by factor as if it were a vector.
/// Important Note: This function accepts a num as its argument only so that you
/// can scale Point<double> objects by an int factor.
/// Because the star operator always returns the same type of Point that
/// originally called it, passing in a double factor on a Point<int> causes a
/// compile time error
/// @description Checks that if at least one of coordinates is null, a compile
/// time error occurs
/// @author kaigorodov, sgrekhov@unipro.ru

import "dart:math";

main() {
  new Point(0, 0) * null;
//                  ^^^^
// [analyzer] COMPILE_TIME_ERROR.ARGUMENT_TYPE_NOT_ASSIGNABLE
// [cfe] The value 'null' can't be assigned to a variable of type 'num' because 'num' is not nullable.
  new Point(null, 0) * 1;
//    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new Point(0, null) * 1;
//    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
