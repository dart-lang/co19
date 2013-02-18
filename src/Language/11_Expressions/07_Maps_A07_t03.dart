/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A runtime map literal <String, V>{k1:e1... kn :en}  is evaluated as follows:
 *   - First, the expressions e1...en are evaluated in left to right order, yielding objects o1... on.
 *   - A fresh instance m that implements the built-in interface Map<String, V> is allocated.
 *   - Let ui be the value of the string literal specified by ki.
 *     The operator []= is invoked on m with first argument ui and second argument oi, 0 <= i < n.
 *   - The result of the evaluation is m.
 * @description Checks that entries with keys ui and values oi are added to the resulted map object.
 * @author msyabro
 * @needsreview issue 1478
 * @reviewer kaigorodov
 */
import "../../Utils/expect.dart";

main() {
  var m = {"k1": 1, "k2": 2, "k3": 3, "k4": "4"};
  Expect.isTrue(m.containsKey("k1"));
  Expect.equals(1, m["k1"]);
  Expect.isTrue(m.containsKey("k2"));
  Expect.equals(2, m["k2"]);
  Expect.isTrue(m.containsKey("k3"));
  Expect.equals(3, m["k3"]);
  Expect.isTrue(m.containsKey("k4"));
  Expect.equals("4", m["k4"]);

  m = {};
  Expect.isTrue(m.isEmpty);

  m = <String, bool> {"true": 1 > 2, "false": true || false};
  Expect.isTrue(m.containsKey("true"));
  Expect.equals(false, m["true"]);
  Expect.isTrue(m.containsKey("false"));
  Expect.equals(true, m["false"]);

  var x = 1;
  var y = 2;
  m = {"$x" : 1, "$y" : 2};
  Expect.isTrue(m.containsKey("1"));
  Expect.equals(1, m["1"]);
  Expect.isTrue(m.containsKey("2"));
  Expect.equals(2, m["2"]);
}
