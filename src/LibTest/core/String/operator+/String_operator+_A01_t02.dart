/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Converts [other] to a string and creates a new string by
 * concatenating this string with the converted [other].
 * @description Check operator on custom class
 * @author msyabro
 * @reviewer rodionov
 */

class A {
  A() {}
  String toString() {
    return "A";
  }
}


main() {
  String str = "class: ";
  A a = new A();
  
  Expect.isTrue(str + a == "class: A");
}
