/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion All functions implement the interface Function, so all function types are a subtype of Function.
 * @description Checks that function literals implement the interface Function.
 * @author iefremov
 * @reviewer rodionov
 */

main() {
  Expect.isTrue(f() {} is Function);
  Expect.isTrue(void f() {} is Function);
  Expect.isTrue(Object f() {} is Function);
  Expect.isTrue(int f() {} is Function);
  Expect.isTrue(f(var x) {} is Function);
  Expect.isTrue(void f(var x) {} is Function);
  Expect.isTrue(String f([var x]) {} is Function);
  Expect.isTrue(Object f(var x, int z, [Object o, var v = 1]) {} is Function);

  Expect.isTrue(((var x) => null) is Function);
  Expect.isTrue(((int x) => x) is Function);
  Expect.isTrue((([var x]) => "aa") is Function);
  Expect.isTrue(((var x, int z, [Object o, var v = 1]) => x + z + o + v) is Function);

}

