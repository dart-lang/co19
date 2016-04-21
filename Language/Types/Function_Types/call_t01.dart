/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a type I includes an instance method named call, and the type
 * of call is the function type F, then I is considered to be more specific than
 * F. It is a static warning if a concrete class implements Function and does
 * not have a concrete method named call unless that class has an implementation
 * of noSuchMethod() distinct from the one declared in class Object.
 * @description Checks that declaring a method named call with a function type F
 * makes the declaring type a subtype of F.
 * @author msyabro
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

typedef void f(p1, p2);
typedef int g(p1, p2, [p3]);
typedef bool h(p1, p2, {p3});

class I {
  void call(a1, a2) {}
}

class J {
  int call(a1, a2, [a3]) {}
}

class K {
  bool call(a1, a2, {p3}) {}
}

main() {
  Expect.isTrue(new I() is f);
  Expect.isFalse(new I() is g);
  Expect.isFalse(new I() is h);

  Expect.isTrue(new J() is f);
  Expect.isTrue(new J() is g);
  Expect.isFalse(new J() is h);

  Expect.isTrue(new K() is f);
  Expect.isFalse(new K() is g);
  Expect.isTrue(new K() is h);
}
