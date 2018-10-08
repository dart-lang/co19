/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An assignable expression of the form e1[e2] is evaluated as a
 * method invocation of the operator method [] on e1 with argument e2.
 * @description Checks that an assignable expression of the form e1[e2] is
 * evaluated as a method invocation of the operator method [] on e1 with
 * argument e2.
 * @author msyabro
 */
import '../../../Utils/expect.dart';


class A {
  operator [](var ind) {return ind * 2;}
}

main() {
  A a = new A();
  Expect.equals(0, a[0]);
  Expect.equals(2, a[1]);
  Expect.equals(4, a[2]);
  Expect.equals(2000, a[1000]);
}
