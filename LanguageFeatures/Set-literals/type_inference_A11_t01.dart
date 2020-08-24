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
 * If none of these cases match, it is an error.
 *
 * @description Checks that it is a compile error if none of the cases
 * (`Iterable<Object>` nor of `Map<Object, Object>`, and it's also not `dynamic`
 * nor `Null`) match
 * @author sgrekhov@unipro.ru
 */

void test<T>(T t) {
  var s1 = {...t };                //# 01: compile-time error
  var s2 = {...?t};                //# 02: compile-time error

  var s3 = {...(t as dynamic) };   //# 03: compile-time error
  var s4 = {...?(t as dynamic)};   //# 04: compile-time error
}

main() {
  test([1, 2, 3]);
  test({1: "1", 2: "2"});
}
