/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If no extends clause is specified for the class then the class implicitly extends Object.
 * @description Checks that any class has methods inherited from Object.
 * @author iefremov
 * @reviewer msyabro
 */


class A {
  A() {}
}


main() {
  Expect.isTrue(null != new A().toString());
  Expect.isTrue(null != new A().dynamic);
  //new A().noSuchMethod(""); TODO
}
