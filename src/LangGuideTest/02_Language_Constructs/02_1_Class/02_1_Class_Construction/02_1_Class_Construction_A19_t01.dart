/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Factory constructors on classes can also act as factories for interfaces.
 * @description Trivial check.
 * @author iefremov
 * @reviewer msyabro
 */

interface I factory IFactory {
  I(x);
}

class IClass implements I {
  IClass(this.x) {}
  var x;
}

class IFactory {
  factory I(x) {
    return new IClass(x);
  }
}


void main() {
  IClass i = new I(42);
  Expect.isTrue(i.x == 42);
}
