/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A static variable is a variable that is not associated with a 
 * particular instance, but rather with an entire library or class. 
 * @description Checks that a static variable is associated with a class.
 * @author vasya
 * @reviewer kaigorodov
 */

class C {
  static var foo;
  static bool b = true;
  static int i = -1;
  static double d = 1.9999;
  static String s = "static";
}

main() {
  Expect.equals(null, C.foo);
  Expect.equals(true, C.b);
  Expect.equals(-1, C.i);
  Expect.equals(1.9999, C.d);
  Expect.equals("static", C.s);
}

