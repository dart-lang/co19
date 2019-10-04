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
  dynamic x1;
  List x2;
  Set x3;
  Iterable x4;
  Null x5;

  Set s1  = {...?x1};
  Set s2  = {...?x2};
  Set s3  = {...?x3};
  Set s4  = {...?x4};
  Set s5  = {...?x5};
}
