/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If element is an ifElement with one element, p1, and no "else"
 * element:
 *
 * The condition is inferred with a context type of bool.
 *
 * If the inferred set element type of p1 is S then the inferred set element
 * type of element is S.
 *
 * @description Checks that if the inferred set element type of p1 is S then the
 * inferred set element type of element is S
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

class A {}
class B extends A {}
class C extends B {}

main() {
  var i = 1;
  var set1 = {
    if (i > 0) "",
  };
  Expect.isTrue(set1 is Set<String>);

  var set2 = {
    "",
    if (i < 0) 1,
  };
  Expect.isTrue(set2 is Set<Object>);
  Expect.isFalse(set2 is Set<String>);
  Expect.isFalse(set2 is Set<num>);

  var set3 = {
    new C(),
    if (i > 0) new B(),
    if (i < 0) new A()
  };
  Expect.isTrue(set3 is Set<A>);
  Expect.isFalse(set3 is Set<B>);
}
