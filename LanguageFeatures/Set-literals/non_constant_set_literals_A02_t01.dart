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
 * @description Check that evaluation of non-constant element expression is
 * performed as expected
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "../../Utils/expect.dart";

dynamic getDynamic(dynamic d) => d;

main() {
  var s0 = <int> {};
  Expect.isTrue(s0 is LinkedHashSet<int>);
  LinkedHashSet<int> o0 = new LinkedHashSet<int>();
  Expect.iterableEquals(o0, s0);

  var s1 = <int> {3, 1, 4, null, 1, 4};
  LinkedHashSet<int> o1 = new LinkedHashSet<int>();
  o1.add(3);
  o1.add(1);
  o1.add(4);
  o1.add(null);
  o1.add(1);
  o1.add(4);
  Expect.iterableEquals(o1, s1);

  var s2 = <Object> {'3', 1, 4, null, 1, null,};
  LinkedHashSet<Object> o2 = new LinkedHashSet<Object>();
  o2.add('3');
  o2.add(1);
  o2.add(4);
  o2.add(null);
  o2.add(1);
  o2.add(null);
  Expect.iterableEquals(o2, s2);

  var s3 = {3, 1, 4, null, 1, null, getDynamic(5),};
  LinkedHashSet<dynamic> o3 = new LinkedHashSet<dynamic>();
  o3.add(3);
  o3.add(1);
  o3.add(4);
  o3.add(null);
  o3.add(1);
  o3.add(null);
  o3.add(getDynamic(5));
  Expect.iterableEquals(o3, s3);

  var s4 = {1, 1.0};
  LinkedHashSet<dynamic> o4 = new LinkedHashSet<dynamic>();
  o4.add(1);
  o4.add(1.0);
  Expect.iterableEquals(o4, s4);

  var s5 = {1.0, 1};
  Expect.iterableEquals([1.0], s5);
}
