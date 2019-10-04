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
 * @description Check that trying to use [null] element as a null-aware spread
 * element does not cause compile error
 * @author iarkh@unipro.ru
 */

Null n = null;

main() {
  var res1 = [...?n];
  Map res2 = {...?n};
  Set res3 = {...?n};

  var res4 = <int>[...?n];
  var res5 = <int>{...?n};
  var res6 = <int, int>{...?n};
}
