/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The upwards inference key type of a for map element is the key
 * type of the body element, likewise for the value type.
 *
 * @description Checks that the upwards inference key type of a for map element
 * is the key type of the body element, likewise for the value type.
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

class A {}
class B extends A {}
class C extends B {}

main() {
  var i = 1;
  var map1 = {
    new C(): B(),
    for (int i = 0; i < 2; i++)
      new B(): A()
  };
  Expect.isTrue(map1 is Map<B, A>);

  var map2 = {
    "": "",
    for (int i = 0; i < 2; i++)  "": 1,
  };
  Expect.isTrue(map2 is Map<String, Object>);

  var map3 = {
    1: 1,
    for (var i in []) 3.14: 1
  };
  Expect.isTrue(map3 is Map<num, int>);
}
