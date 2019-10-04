/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If element is a forElement with element e1 then:
 *
 * Inference for the iterated expression and the controlling variable is done as
 * for the corresponding for or await for statement.
 *
 * If the inferred key type of e1 is K and the inferred key type of e1 is V then
 * the inferred key and value types of element are K and V
 *
 * @description Checks that if element is a forElement with element e1 then if
 * the inferred key type of e1 is K and the inferred key type of e1 is V then
 * the inferred key and value types of element are K and V
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

class A {}
class B extends A {}
class C extends B {}

main() {
  var map1 = {
    for (var i = 1; i < 5; i++)
      if (i.isEven) 3: 3.14 else 3.14: 3
  };
  Expect.isTrue(map1 is Map<num, num>);
  Expect.isFalse(map1 is Map<int, num>);
  Expect.isFalse(map1 is Map<double, num>);
  Expect.isFalse(map1 is Map<num, int>);
  Expect.isFalse(map1 is Map<num, double>);

  var map2 = {
    "": "",
    for (var i = 1; i < 5; i++)
      if (i.isEven) 3: 3.14 else 3.14: 3
  };
  Expect.isTrue(map2 is Map<Object, Object>);
  Expect.isFalse(map2 is Map<Object, num>);
  Expect.isFalse(map2 is Map<Object, String>);
  Expect.isFalse(map2 is Map<String, Object>);
  Expect.isFalse(map2 is Map<num, Object>);

  var map3 = {
    new C(): new B(),
    for (var i = 1; i < 5; i++) new B(): new A()
  };
  Expect.isTrue(map3 is Map<B, A>);
  Expect.isFalse(map3 is Map<B, B>);
  Expect.isFalse(map3 is Map<A, C>);
}
