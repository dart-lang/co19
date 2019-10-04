/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion To infer the type of element:
 * ...
 * If element is a spreadElement with expression e1:
 *
 * If P is ? then let S be the inferred type of e1 in context ?:
 * ...
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

void test1<T extends Map<num, String>>(T t) {
  var m1 = {...t};
  var m2 = {...?t};
  Expect.isTrue(m1 is Map<num, String>);
  Expect.isTrue(m2 is Map<num, String>);
  Expect.isFalse(m1 is Map<int, String>);
  Expect.isFalse(m2 is Map<int, String>);
}

void test2<T extends Map<Object, Object>>(T t) {
  var m1 = {...t};
  var m2 = {...?t};
  Expect.isTrue(m1 is Map<Object, Object>);
  Expect.isTrue(m2 is Map<Object, Object>);
  Expect.isFalse(m1 is Map<int, String>);
  Expect.isFalse(m2 is Map<int, String>);
}

main() {
  int x = 1;
  test1({1: "1", 2: "2", 3: "3"});
  test2({1: "1", 2: "2", 3: "3"});
}
