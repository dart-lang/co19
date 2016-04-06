/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A function is always an instance of some class that implements the
 * class Function and implements a call method with the same signature as the
 * function. All function types are subtypes of Function.
 * @description Checks that both instance and static methods of classes also
 * implement Function.
 * @author iefremov
 * @reviewer rodionov
 * @needsreview looks like it is impossible to check constructors, operators and
 * getters/setters because they can't be referenced like methods.
 */
import "../../../Utils/expect.dart";

class C {
  f1() {}
  void f2() {}
  Object f3() {}
  int f4() {}
  f5(var x) {}
  void f6(var x) {}
  String f7([var x]) {}
  Object f8(var x, int z, [Object o, var v = 1]) {}
  Object f9(var x, int z, {o, v: 1}) {}

  static f1s() {}
  static void f2s() {}
  static Object f3s() {}
  static int f4s() {}
  static f5s(var x) {}
  static void f6s(var x) {}
  static String f7s([var x]) {}
  static Object f8s(var x, int z, [Object o, var v = 1]) {}
  static Object f9s(var x, int z, {o, v: 1}) {}
}

main() {
  C c = new C();
  Expect.isTrue(c.f1 is Function);
  Expect.isTrue(c.f2 is Function);
  Expect.isTrue(c.f3 is Function);
  Expect.isTrue(c.f4 is Function);
  Expect.isTrue(c.f5 is Function);
  Expect.isTrue(c.f6 is Function);
  Expect.isTrue(c.f7 is Function);
  Expect.isTrue(c.f8 is Function);
  Expect.isTrue(c.f9 is Function);

  Expect.isTrue(C.f1s is Function);
  Expect.isTrue(C.f2s is Function);
  Expect.isTrue(C.f3s is Function);
  Expect.isTrue(C.f4s is Function);
  Expect.isTrue(C.f5s is Function);
  Expect.isTrue(C.f6s is Function);
  Expect.isTrue(C.f7s is Function);
  Expect.isTrue(C.f8s is Function);
  Expect.isTrue(C.f9s is Function);
}
