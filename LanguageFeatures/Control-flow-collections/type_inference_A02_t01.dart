/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The upwards inference element type of an if list element without
 * an else is the type of the "then" element.
 *
 * @description Checks that the upwards inference element type of an if list
 * element without an else is the type of the "then" element.
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

class A {}
class B extends A {}
class C extends B {}

main() {
  var i = 1;
  var list1 = [
    if (i > 0) "",
  ];
  Expect.isTrue(list1 is List<String>);

  var list2 = [
    "",
    if (i < 0) 1,
  ];
  Expect.isTrue(list2 is List<Object>);

  var list3 = [
    new C(),
    if (i > 0) new B(),
    if (i < 0) new A()
  ];
  Expect.isTrue(list3 is List<A>);
}
