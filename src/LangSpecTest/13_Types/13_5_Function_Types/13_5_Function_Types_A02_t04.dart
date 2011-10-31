/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion All functions implement the interface Function, so all function types are a subtype of Function.
 * @description Checks that various function literals implement the interface Function.
 * @author iefremov
 */

main() {
  Expect.isTrue(f1() {} is Function);
  Expect.isTrue(void f2() {} is Function);
  Expect.isTrue(Object f3() {} is Function);
  Expect.isTrue(int f4() {} is Function);
  Expect.isTrue(f5(var x) {} is Function);
  Expect.isTrue(void f6(var x) {} is Function);
  Expect.isTrue(String f7([var x]) {} is Function);
  Expect.isTrue(Object f8(var x, int z, [Object o, var v = 1]) {} is Function);

  var f = (var x) => null;
  Expect.isTrue(f is Function);
  f = (int x) => x;
  Expect.isTrue(f is Function);
  f = ([var x]) => "aa";
  Expect.isTrue(f is Function);
  f = (var x, int z, [Object o, var v = 1]) => x + z + o + v;
  Expect.isTrue(f is Function);

}

