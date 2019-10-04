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

main() {
  var res1 = [...?null];
  Map res2 = {...?null};
  Set res3 = {...?null};

  var res4 = <int>[...?null];
  var res5 = <int>{...?null};
  var res6 = <int, int>{...?null};
}
