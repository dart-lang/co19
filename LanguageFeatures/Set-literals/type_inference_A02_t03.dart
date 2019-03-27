/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In a setOrMapLiteral collection, the inferred type of an element
 * is a set element type T, a pair of a key type K and a value type V, or both.
 * It is computed relative to a context type P:
 * ...
 * If collection is unambiguously a map literal then P is Map<Pk, Pv> where Pk
 * and Pv are determined by downwards inference, and may be ? if the downwards
 * context does not constrain one or both.
 *
 * @description Checks that if collection is unambiguously a map literal then P
 * is Map<Pk, Pv> where Pk and Pv are determined by downwards inference, and may
 * be ? if the downwards context does not constrain one or both.
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

void test<X extends num, Y extends Object>(X x, Y y) {
  var m1 = {x: y};
  var m2 = <X, Y>{};
  Expect.isTrue(m1 is Map<int, double>);
  Expect.isTrue(m2 is Map<num, Object>);
}

main() {
  test(3, 3.1415926);
}