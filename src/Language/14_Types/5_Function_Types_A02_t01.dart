/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If an interface type I includes a method named call, and the type of call
 * is the function type F, then I is considered to be a subtype of F.
 * @description Checks that a method named call and having a function type F makes the
 * interface that declares it a subtype of F.
 * @author msyabro
 * @needsreview Issue 1604, 1355
 */

typedef void f(p1, p2);
typedef int g(p1, p2, [p3]);

interface I {
  void call(p1, p2);
}

class IImpl implements I {}

class C {
  int call(p1, p2, [p3]) {}
}

main() {
  Expect.isTrue(new IImpl() is f);
  Expect.isFalse(new IImpl() is g);
  Expect.isTrue(new C() is g);
  Expect.isFalse(new C() is f);
}
