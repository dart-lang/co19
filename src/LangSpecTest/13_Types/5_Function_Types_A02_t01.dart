/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion All functions implement the interface Function, so all function types are a subtype of Function.
 * @description Checks that various global functions types are a subtype of Function.
 * @author iefremov
 * @reviewer rodionov
 */

f1() {}
void f2() {}
Object f3() {}
int f4() {}
f5(var x) {}
void f6(var x) {}
String f7([var x]) {}
Object f8(var x, int z, [Object o, var v = 1]) {}

main() {
  Expect.isTrue(f1 is Function);
  Expect.isTrue(f2 is Function);
  Expect.isTrue(f3 is Function);
  Expect.isTrue(f4 is Function);
  Expect.isTrue(f5 is Function);
  Expect.isTrue(f6 is Function);
  Expect.isTrue(f7 is Function);
  Expect.isTrue(f8 is Function);
}

