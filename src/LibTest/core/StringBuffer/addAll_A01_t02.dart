/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adds all items in [objects] to the buffer.
 * @description Tries to pass a list with elements that are null or aren't
 *              Strings as argument, correct string conversion expected
 * @author msyabro
 * @reviewer rodionov
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
  Expect.equals("123", sb.toString());
  
  sb.clear();
  sb.addAll([true, false]);
  Expect.equals("truefalse", sb.toString());
  
  sb.clear();
  sb.addAll(["a", " ", null, " ", new A()]);
  Expect.equals("a null class A", sb.toString());
}
