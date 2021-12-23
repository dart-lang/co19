// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If element is an ifElement with one element, p1, and no "else"
/// element:
/// ...
/// If the inferred key type of e1 is K1 and the inferred key type of e1 is V1
/// and the inferred key type of e2 is K2 and the inferred key type of e2 is V2
/// then the inferred key type of element is the least upper bound of K1 and K2
/// and the inferred value type is the least upper bound of V1 and V2.
///
/// @description Checks that if the inferred key type of e1 is K1 and the
/// inferred key type of e1 is V1 and the inferred key type of e2 is K2 and the
/// inferred key type of e2 is V2 then the inferred key type of element is the
/// least upper bound of K1 and K2 and the inferred value type is the least upper
/// bound of V1 and V2.
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

class A {}
class B extends A {}
class C extends B {}

main() {
  var i = 1;
  var map1 = {
    if (i > 0) 1:1 else 1.1: 1.1,
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
    if (i > 0) 1: 1 else 1.1: 1.2,
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
    if (i > 0) new B(): new B() else new A(): new B()
  };
  Expect.isTrue(map3 is Map<A, B>);
  Expect.isFalse(map3 is Map<B, B>);
  Expect.isFalse(map3 is Map<A, C>);
  Expect.runtimeIsType<Map<A, B>>(map3);
  Expect.runtimeIsNotType<Map<B, B>>(map3);
  Expect.runtimeIsNotType<Map<A, C>>(map3);
}
