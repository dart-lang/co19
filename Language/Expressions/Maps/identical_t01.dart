/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let map1 = const< K, V >{k11: e11 ... k1n: e1n } and map2 =
 * const< J, U >{k21: e21 ... k2n: e2n } be two constant map literals. Let the
 * keys of map1 and map2 evaluate to s11 ... s1n and s21 ... s2n respectively,
 * and let the elements of map1 and map2 evaluate to o11 ... o1n and o21 ... o2n
 * respectively. Iff identical(o1i, o2i) and identical(s1i, s2i) for i ∈ 1..n,
 * and V = U then identical(map1, map2).
 * @description Checks that constant map literals with identical entries and
 * type arguments are identical.
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

main() {
  Expect.isTrue(identical(const {}, const {}));

  Expect.isTrue(identical(const {"key 1": 1, "key 2": 2},
                          const {"key 1": 1, "key 2": 2}));
  Expect.isTrue(identical(const {"": true}, const {"": true}));
  Expect.isTrue(identical(const {"key": "value", "value": "key"},
                          const {"key": "value", "value": "key"}));
  Expect.isTrue(identical(const <String, int>{"1": 1},
                          const <String, int>{"1": 1}));

  var m1 = const {"k1": 1, "k2": true, "k3": ""};
  var m2 = const {"k1": 1, "k2": true, "k3": ""};
  Expect.isTrue(identical(m1, m2));
}
