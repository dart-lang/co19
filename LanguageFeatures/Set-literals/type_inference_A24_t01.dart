/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Finally, we define inference on a setOrMapLiteral collection as
 * follows:
 * ...
 * Else, if collection is unambiguously a map literal where P is Map<Pk, Pv>:
 *
 * If Pv is ? then the static value type of collection is V where V is the least
 * upper bound of the inferred value types of the elements.
 *
 * @description Checks that if collection is unambiguously a map literal and Pv
 * is ? then the static value type of collection is V where V is the least
 * upper bound of the inferred value types of the elements
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

class C<K, V> {
  test(K k, V v) {
    var m = {k: v, 1: 2};
    Expect.isTrue(m is Map<Object, Object>);
    Expect.isFalse(m is Map<int, Object>);
    Expect.isFalse(m is Map<Object, int>);
  }
}

main() {
  C<int, int>().test(3, 4);
}
