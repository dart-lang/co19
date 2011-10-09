/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adds all items in [objects] to the buffer. Returns [this].
 * @description Try to pass array with not String objects
 * @author msyabro
 */

class A {
  A() {}
  String toString() {
    return "class A";
  }
}


main() {
  StringBuffer sb = new StringBuffer();
  sb.addAll([1, 2, 3]);
  Expect.isTrue(sb.toString() == "123");
  
  sb.clear();
  sb.addAll([true, false]);
  Expect.isTrue(sb.toString() == "truefalse");
  
  sb.clear();
  sb.addAll(["a", " ", null, " ", new A()]);
  Expect.isTrue(sb.toString() == "a null class A");
}
