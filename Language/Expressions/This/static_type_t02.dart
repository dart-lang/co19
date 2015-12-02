/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of this is the interface of the immediately
 * enclosing class.
 * @description Checks that type of 'this' is the class itself.
 * @static-clean
 * @author hlodvig
 * @reviewer kaigorodov
 */

class A {
  A getSelf() {
    return this;
  }
}
class B {
  B getSelf() {
    return this;
  }
}
main() {
  A a = new A().getSelf();
  B b = new B().getSelf();
}
