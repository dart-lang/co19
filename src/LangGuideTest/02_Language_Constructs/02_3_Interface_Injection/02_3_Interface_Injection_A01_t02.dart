/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dart allows injection of interfaces into a class or interface.
 * The type checker validates that the class actually implements the interface.
 * @description Checks interface injection into interface.
 * @author iefremov
 * @reviewer msyabro
 */

interface Instructable {
  int action();
  void cut();
}

interface Actionable {
  int action();
}

interface Instructable extends Actionable;

class C implements Instructable {
  C() {}
  int action() {
    return 42;
  }
}


void main() {
  Instructable i = new C();
  Expect.isTrue(42 == i.action());
}
