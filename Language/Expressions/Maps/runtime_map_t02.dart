/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A runtime map literal <K, V>{k1: e1...kn: en} is evaluated as
 * follows:
 * • First, the expression ki is evaluated yielding object ui, the ei is
 *   evaluated yielding object oi, for i ∈ 1..n in left to right order, yielding
 *    objects u1; o1 ... un; on.
 * • A fresh instance m whose class implements the built-in class Map<K, V> is
 *   allocated.
 * • The operator []= is invoked on m with first argument ui and second argument
 *   oi, i ∈ 1..n.
 * • The result of the evaluation is m.
 * @description Checks that a fresh instance is allocated when evaluating a
 * runtime map literal.
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

main() {
  var m = {"k1": 1, "k2": 2, "k3": 3};
  for (int i = 0; i < 10; ++i) {
    var tmp = {"k1": 1, "k2": 2, "k3": 3};
    Expect.isFalse(identical(m, tmp));
    m = tmp;
  }
}
