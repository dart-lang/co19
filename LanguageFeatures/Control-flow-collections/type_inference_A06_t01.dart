/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The upwards inference key type of an if map element without an
 * else is the key type of the "then" element, likewise for the value type
 *
 * @description Checks that the upwards inference key type of an if map element
 * without an else is the key type of the "then" element, likewise for the value
 * type
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

class A {}
class B extends A {}
class C extends B {}

main() {
  var i = 1;
  var map1 = {
    if (i > 0) "": i,
  };
  Expect.isTrue(map1 is Map<String, int>);

  var map2 = {
    "": "",
    if (i < 0) "": 1,
  };
  Expect.isTrue(map2 is Map<String, Object>);

  var map3 = {
    new C(): new C(),
    if (i > 0) new B(): new B(),
    if (i < 0) new B(): new A()
  };
  Expect.isTrue(map3 is Map<B, A>);
}
