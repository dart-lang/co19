// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion It is a compile-time error if:
 * A non-null-aware spread element has static type Null.
 * @description Checks that compile error is thrown if spread element is
 * statically [Null].
 * @description Check that trying to use [null] element as a non-null-aware
 * spread element causes compile error
 * @author iarkh@unipro.ru
 */

Null n = null;

main() {
  var res1 = [...n];
// [error line 19, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  Map res2 = {...n};
// [error line 23, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  Set res3 = {...n};
// [error line 27, column 0]
// [analyzer] unspecified
// [cfe] unspecified

  var res4 = <int>[...n];
// [error line 32, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  var res5 = <int>{...n};
// [error line 36, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  var res6 = <int, int>{...n};
// [error line 40, column 0]
// [analyzer] unspecified
// [cfe] unspecified
}
