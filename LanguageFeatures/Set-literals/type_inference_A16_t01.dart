/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion To infer the type of element:
 * ...
 * If element is a spreadElement with expression e1:
 * ...
 * If P is Map<Pk, Pv> then let S be the inferred type of e1 in context P:
 * If S is a non-Null subtype of Map<Object, Object>, then the inferred key type
 * of element is K and the inferred value type of element is V, where K and V
 * are the types such that Map<K, V> is a superinterface of S (the result of
 * constraint matching for X and Y using the constraint S <: Map<X, Y>).
 *
 * @description Checks that if S is a non-Null subtype of Map<Object, Object>,
 * then the inferred key type of element is K and the inferred value type of
 * element is V, where K and V are the types such that Map<K, V> is a
 * superinterface of S
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  var m1 = {};
  var x1 = {...m1};
  Expect.isTrue(x1 is Map<dynamic, dynamic>);

  var m2 = {1.0: "1", 2.0: "2", 3: "3", 4: "4"};
  var x2 = {...m2};
  Expect.isTrue(x2 is Map<num, String>);
  Expect.isFalse(x2 is Map<int, String>);
  Expect.isFalse(x2 is Map<double, String>);

  var m3 = {1.0: 1.0, 2: 2, "3": "3", 4: 4};
  var x3 = {...m3};
  Expect.isTrue(x3 is Map<Object, Object>);
  Expect.isFalse(x3 is Map<num, Object>);
  Expect.isFalse(x3 is Map<String, Object>);
  Expect.isFalse(x3 is Map<Object, num>);
  Expect.isFalse(x3 is Map<Object, String>);
}
