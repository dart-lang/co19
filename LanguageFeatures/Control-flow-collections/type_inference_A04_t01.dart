/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The upwards inference element type of a for list element is the
 * type of the body element.
 *
 * @description Checks that the upwards inference element type of a for list
 * element is the type of the body element.
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
    for (int i = 0; i < 2; i++)
      new B()
  ];
  Expect.isTrue(list1 is List<B>);

  var list2 = [
    "",
    for (int i = 0; i < 2; i++)  1,
  ];
  Expect.isTrue(list2 is List<Object>);

  var list3 = [
    1,
    for (var i in []) 3.14
  ];
  Expect.isTrue(list3 is List<num>);
}
