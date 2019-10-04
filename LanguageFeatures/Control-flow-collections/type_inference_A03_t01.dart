/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The upwards inference element type of an if-else list element is
 * the least upper bound of the types of the "then" and "else" elements.
 *
 * @description Checks that the upwards inference element type of an if-else
 * list element is the least upper bound of the types of the "then" and "else"
 * elements.
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

class A {}
class B extends A {}
class C extends B {}

main() {
  var i = 1;
  var list1 = [
    new C(),
    if (i > 0) new B() else new A()
  ];
  Expect.isTrue(list1 is List<A>);

  var list2 = [
    "",
    if (i < 0) "" else 1,
  ];
  Expect.isTrue(list2 is List<Object>);

  var list3 = [
    1,
    if (i > 0) 3 else 3.14,
    if (i < 0) 2
  ];
  Expect.isTrue(list3 is List<num>);
}
