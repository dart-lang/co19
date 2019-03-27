/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In a setOrMapLiteral collection, the inferred type of an element
 * is a set element type T, a pair of a key type K and a value type V, or both.
 * It is computed relative to a context type P:
 *
 * If collection is unambiguously a set literal, then P is Set<Pe> where Pe is
 * determined by downwards inference, and may be ? if downwards inference does
 * not constrain it.
 *
 * @description Checks that if collection is unambiguously a set literal, then P
 * is Set<Pe> where Pe is determined by downwards inference and may be ?
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

void test1<X>(X x, X y) {
  var s = {x, y};
  Expect.isTrue(s is Set<int>);
}

void test2<X>(X x, X y) {
  var s = {x, y};
  Expect.isTrue(s is Set<double>);
}

void test3<X>(X x, X y) {
  var s = {x, y};
  Expect.isTrue(s is Set<num>);
}

main() {
  test1(3, 1);
  test2(3.14, 2.718);
  test3(3, 2.718);
}
