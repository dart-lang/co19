/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A function is always an instance of some class that implements the
 * class Function and implements a call method with the same signature as the
 * function. All function types are subtypes of Function.
 * @description Checks that the types of various top-level functions are a
 * subtype of Function.
 * @author iefremov
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

f1() {}
void f2() {}
Object f3() {}
int f4() {}
f5(var x) {}
void f6(var x) {}
String f7([var x]) {}
Object f8(var x, int z, [Object o, var v = 1]) {}
Object f9(var xx, int zz, {o, v: 1}) {}

main() {
  Expect.isTrue(f1 is Function);
  Expect.isTrue(f2 is Function);
  Expect.isTrue(f3 is Function);
  Expect.isTrue(f4 is Function);
  Expect.isTrue(f5 is Function);
  Expect.isTrue(f6 is Function);
  Expect.isTrue(f7 is Function);
  Expect.isTrue(f8 is Function);
  Expect.isTrue(f9 is Function);
}
