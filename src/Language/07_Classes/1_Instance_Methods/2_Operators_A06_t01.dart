/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The operator call can have any arity.
 * @description Checks that the operator call can have any arity.
 * @author msyabro
 * @needsreview Issue 1604
 */

class Nullary {
  operator call() {}
}

class Unary {
  operator call(p1) {}
}

class Binary {
  operator call(p1, p2){}
}

class Ternary {
  operator call(p1, p2, p3) {}
}

class Quaternary {
  operator call(p1, p2, p3, p4) {}
}

class Quinary {
  operator call(p1, p2, p3, p4, p5) {}
}

main() {
  new Nullary()();
  new Unary()(1);
  new Binary()(1, 2);
  new Ternary()(1, 2, 3);
  new Quaternary()(1, 2, 3, 4);
  new Quinary()(1, 2, 3, 4, 5);
}
