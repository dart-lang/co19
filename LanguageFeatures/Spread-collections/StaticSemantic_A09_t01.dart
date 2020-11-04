/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if:
 * A non-null-aware spread element has static type Null.
 * @description Checks that compile error is thrown if spread element is
 * statically [Null].
 * @description Check that trying to use [null] element as a non-null-aware
 * spread element causes compile error
 * @author iarkh@unipro.ru
 */

main() {
  var res1 = [...null];
// [error line 17, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  Map res2 = {...null};
// [error line 21, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  Set res3 = {...null};
// [error line 25, column 0]
// [analyzer] unspecified
// [cfe] unspecified

  var res4 = <int>[...null];
// [error line 30, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  var res5 = <int>{...null};
// [error line 34, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  var res6 = <int, int>{...null};
// [error line 38, column 0]
// [analyzer] unspecified
// [cfe] unspecified
}
