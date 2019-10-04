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
 *
 * If S is a non-Null subtype of Iterable<Object>, then the inferred set element
 * type of element is T where T is the type such that Iterable<T> is a
 * superinterface of S (the result of constraint matching for X using the
 * constraint S <: Iterable<X>).
 *
 * @description Checks that if S is a non-Null subtype of Iterable<Object>, then
 * the inferred set element type of element is T where T is the type such that
 * Iterable<T> is a superinterface of S
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

void test1<T extends Iterable<num>>(T t) {
  var s1 = {...t};
  var s2 = {...?t};
  Expect.isTrue(s1 is Set<num>);
  Expect.isFalse(s1 is Set<int>);
  Expect.isTrue(s2 is Set<num>);
  Expect.isFalse(s2 is Set<int>);
}

void test2<T extends Iterable<Object>>(T t) {
  var s1 = {...t};
  var s2 = {...?t};
  Expect.isTrue(s1 is Set<Object>);
  Expect.isFalse(s1 is Set<num>);
  Expect.isTrue(s2 is Set<Object>);
  Expect.isFalse(s2 is Set<num>);
}

main() {
  int x = 2;
  test1([1, x, 3, 4]);
  test2([1.0, 2.0, x, 4]);
}
