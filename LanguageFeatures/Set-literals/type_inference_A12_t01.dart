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
 * If P is Set<Ps> then let S be the inferred type of e1 in context Iterable<Ps>:
 * ...
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

main() {
  var s1 = [1, 2, 3, 4];
  var x1 = {...s1};
  Expect.isTrue(x1 is Set<int>);

  var s2 = [1.0, 2.0, 3, 4];
  var x2 = {...s2};
  Expect.isTrue(x2 is Set<num>);
  Expect.isFalse(x2 is Set<int>);
  Expect.isFalse(x2 is Set<double>);

  var s3 = [1.0, 2, "3", 4];
  var x3 = {...s3};
  Expect.isTrue(x3 is Set<Object>);
  Expect.isFalse(x3 is Set<num>);
  Expect.isFalse(x3 is Set<String>);
}
