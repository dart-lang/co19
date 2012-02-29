/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If an interface type I includes the special operator call, and the type of call
 * is the function type F, then I is considered to be a subtype of F.
 * @description Checks that interfaces with operator call of type F are subtypes of F.
 * @author msyabro
 * @needsreview Issue 1604
 */

typedef void f(p1, p2);
typedef int g(p1, p2, [p3]);

interface I {
  operator call(p1, p2);
}

class IImpl implements I {}

class C {
  int operator call(p1, p2, [p3]) {}
}

main() {
  I i = new IImpl();
  C c = new C();
  Expect.isTrue(i is f);
  Expect.isTrue(c is g);
}
