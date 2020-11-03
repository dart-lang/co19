/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if:
 * A spread element in a list or set literal has a static type that is not
 * dynamic and not a subtype of Iterable<Object>.
 * @description Checks that compile error is thrown if null-aware spread element
 * in the sett is not dynamic and is not assignable to [Iterable] or [Null]
 * @author iarkh@unipro.ru
 */

import "dart:async";

main() {
  Object? x1;
  Map? x2;
  int? x3;
  void x4;
  Future? x5;
  FutureOr x6;

  Set s1 = {...?x1};
// [error line 25, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  Set s2 = {...?x2};
  //       ^^^^^^^^
  // [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
  // [cfe] Both Iterable and Map spread elements encountered in ambiguous literal.
  Set s3 = {...?x3};
// [error line 33, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  Set s4 = {...?x4};
// [error line 37, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  Set s5 = {...?x5};
// [error line 41, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  Set s6 = {...?x6};
// [error line 45, column 0]
// [analyzer] unspecified
// [cfe] unspecified
}
