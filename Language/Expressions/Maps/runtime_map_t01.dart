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
 * @description Checks that values in a map literal are evaluated in order from
 * left to right.
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

var evalOrder;

f(number) {
  evalOrder = '$evalOrder$number';
}

main() {
  evalOrder = "";
  <String, Object>{"k1": f(1), "k2": f(2), "k3": f(3)};
  Expect.equals("123", evalOrder);
}
