/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If s does not start with const and it does not occur in a constant
 * context, then it evaluates to a mutable set object as follows:
 *
 * Let e1 … en be the constant element expressions of s in source order.
 * Evaluation of s proceeds as follows:
 *
 * First evaluate e1 … en, in source order, to values v1 … vn.
 * Create a new LinkedHashSet<T> instance, o.
 * For each i in 1 … n in numeric order, invoke the add method on o with vi as
 * argument. Then s evaluates to an object implementing LinkedHashSet which has
 * the same elements as o, and in the same iteration order. (Iteration order is
 * insertion order, where adding an element equal to one already in the set does
 * not change the set in any way).
 *
 * @description Check that if set literal is not constant then it is mutable
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  var s1 = <int> {};
  s1.add(1);
  Expect.iterableEquals({1}, s1);
  s1.clear();
  Expect.iterableEquals(<int>{}, s1);

  var s2 = <int> {3, 1, 4};
  s2.add(5);
  Expect.iterableEquals({3, 1, 4, 5}, s2);
  s2.clear();
  Expect.iterableEquals(<int>{}, s2);

  var s3 = {1, 2, 3.14, null, true, 1};
  s3.add("x");
  Expect.iterableEquals({1, 2, 3.14, null, true, "x"}, s3);
  s3.clear();
  Expect.iterableEquals(<Object>{}, s3);
}
