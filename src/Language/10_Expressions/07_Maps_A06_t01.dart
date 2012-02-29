/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let map1 = const <V>{k11:e11... k1n :e1n} and map2 = const <U>{k21:e21... k2n :e2n}
 * be two constant map literals. Let the keys of map1 and map2 evaluate to  s11... s1n  and  s21... s2n
 * respectively, and let the elements of map1 and map2 evaluate to o11... o1n and o21... o2n respectively.
 * If o1i === o2i  and s1i === s2i for 1 <= i <= n, and V = U then map1 === map2.
 * @description Checks that constant maps with identical keys, values and type arguments are identical.
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  Expect.isTrue(const {} === const {});

  Expect.isTrue(const {"key 1": 1, "key 2": 2} === const {"key 1": 1, "key 2": 2});
  Expect.isTrue(const {"": true} === const {"": true});
  Expect.isTrue(const {"key": "value", "value": "key"} === const {"key": "value", "value": "key"});
  Expect.isTrue(const <int>{"1": 1} === const <int>{"1": 1});

  var m1 = const {"k1": 1, "k2": true, "k3": ""};
  var m2 = const {"k1": 1, "k2": true, "k3": ""};
  Expect.isTrue(m1 === m2);
}