/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if:
 * A spread element in a map literal has a static type that is not [dynamic] and
 * not a subtype of [Map<Object, Object>].
 * @description Checks that compile error is thrown if null-aware spread element
 * in the map is not dynamic, is not assignable to [Map] and is not [null]
 * @author iarkh@unipro.ru
 */

main() {
  dynamic x1;
  Map x2;
  Null x3;

  Map m1  = {...?x1};
  Map m2  = {...?x2};
  Map m3  = {...?x3};
}
