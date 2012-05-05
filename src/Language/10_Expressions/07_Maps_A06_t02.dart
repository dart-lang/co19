/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let map1 = const <V>{k11:e11... k1n :e1n} and map2 = const <U>{k21:e21... k2n :e2n}
 * be two constant map literals. Let the keys of map1 and map2 evaluate to  s11... s1n  and  s21... s2n
 * respectively, and let the elements of map1 and map2 evaluate to o11... o1n and o21... o2n respectively.
 * Iff o1i === o2i  and s1i === s2i for 1 <= i <= n, and V = U then map1 === map2.
 * @description Checks that constant maps with different keys, values or type arguments are not identical.
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  Expect.isFalse(const <int>{} === const <num>{});

  Expect.isFalse(const {"key 1": 1, "key 2": 2} === const {"key 1": 1, "key 2": 3});
  Expect.isFalse(const {"": true} === const {"true": true});
  Expect.isFalse(const <String>{"key": "value", "value": "key"} === const {"key": "value", "value": "key"});
  Expect.isFalse(const <int>{"1": 1} === const <int>{"1": 1, "2": 2});
}