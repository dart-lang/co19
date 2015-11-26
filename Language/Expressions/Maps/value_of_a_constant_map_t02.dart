/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The value of a constant map literal const <K, V>{k1: e1...kn: en}
 * is an object m whose class implements the built-in class Map < K, V >. The
 * entries of m are ui : vi; i ∈ 1..n, where ui is the value of the
 * compile-time expression ki and vi is the value of the compile-time
 * expression ei. The value of a constant map literal const {k1: e1 ... kn: en}
 * is defined as the value of a constant map literal const
 * <dynamic, dynamic>{k1: e1 ... kn: en}.
 * @description Checks that entries of the resulted object are added correctly.
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

main() {
  var m = const {"k1": 1, "k2": 2, "k3": 3, "k4": "4"};
  Expect.isTrue(m.containsKey("k1"));
  Expect.equals(1, m["k1"]);
  Expect.isTrue(m.containsKey("k2"));
  Expect.equals(2, m["k2"]);
  Expect.isTrue(m.containsKey("k3"));
  Expect.equals(3, m["k3"]);
  Expect.isTrue(m.containsKey("k4"));
  Expect.equals("4", m["k4"]);

  m = const {};
  Expect.isTrue(m.isEmpty);

  m = const <String, bool>{"true": 1 > 2, "false": true || false};
  Expect.isTrue(m.containsKey("true"));
  Expect.equals(false, m["true"]);
  Expect.isTrue(m.containsKey("false"));
  Expect.equals(true, m["false"]);
}
