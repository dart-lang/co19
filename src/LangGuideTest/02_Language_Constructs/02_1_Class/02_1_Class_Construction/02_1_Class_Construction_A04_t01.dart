/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Constructor initializers may be used to initialize any field.
 * @description Checks that various fields may be initialized.
 * @author iefremov
 * @reviewer msyabro 
 */ 


class C {
  C() : v = 1, i = 42, consti = 6031769, c = null, z = "a" {}  

  var v;
  int i;
  final int consti;
  C c;
  var z;
}

void main() {
  C c = new C();
  Expect.isTrue(c.v == 1);
  Expect.isTrue(c.i == 42);
  Expect.isTrue(c.consti == 6031769);
  Expect.isTrue(c.c == null);
  Expect.isTrue(c.z == "a");
}
