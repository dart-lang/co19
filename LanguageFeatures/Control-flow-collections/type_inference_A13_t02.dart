// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If element is a forElement with element e1 then:
///
/// Inference for the iterated expression and the controlling variable is done as
/// for the corresponding for or await for statement.
///
/// If the inferred key type of e1 is K and the inferred key type of e1 is V then
/// the inferred key and value types of element are K and V
///
/// @description Checks that if element is a forElement with element e1 then if
/// the inferred key type of e1 is K and the inferred key type of e1 is V then
/// the inferred key and value types of element are K and V
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

class A {}
class B extends A {}
class C extends B {}

main() {
  var collection = [1, 2, 3, 4, 5];
  var map1 = {
    for (var i in collection)
      if (i.isEven) 3: 3.14 else 3.14: 3
  };
  Expect.isTrue(map1 is Map<num, num>);
  Expect.isFalse(map1 is Map<int, num>);
  Expect.isFalse(map1 is Map<double, num>);
  Expect.isFalse(map1 is Map<num, int>);
  Expect.isFalse(map1 is Map<num, double>);
  Expect.runtimeIsType<Map<num, num>>(map1);
  Expect.runtimeIsNotType<Map<int, num>>(map1);
  Expect.runtimeIsNotType<Map<double, num>>(map1);
  Expect.runtimeIsNotType<Map<num, int>>(map1);
  Expect.runtimeIsNotType<Map<num, double>>(map1);

  var map2 = {
    "": "",
    for (var i in collection)
      if (i.isEven) 3: 3.14 else 3.14: 3
  };
  Expect.isTrue(map2 is Map<Object, Object>);
  Expect.isFalse(map2 is Map<Object, num>);
  Expect.isFalse(map2 is Map<Object, String>);
  Expect.isFalse(map2 is Map<String, Object>);
  Expect.isFalse(map2 is Map<num, Object>);
  Expect.runtimeIsType<Map<Object, Object>>(map2);
  Expect.runtimeIsNotType<Map<Object, num>>(map2);
  Expect.runtimeIsNotType<Map<Object, String>>(map2);
  Expect.runtimeIsNotType<Map<String, Object>>(map2);
  Expect.runtimeIsNotType<Map<num, Object>>(map2);

  var map3 = {
    new C(): new B(),
    for (var i in collection) new B(): new A()
  };
  Expect.isTrue(map3 is Map<B, A>);
  Expect.isFalse(map3 is Map<B, B>);
  Expect.isFalse(map3 is Map<A, C>);
  Expect.runtimeIsType<Map<B, A>>(map3);
  Expect.runtimeIsNotType<Map<B, B>>(map3);
  Expect.runtimeIsNotType<Map<A, C>>(map3);
}
