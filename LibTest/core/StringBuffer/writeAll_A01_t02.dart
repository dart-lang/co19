/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void writeAll(Iterable objects, [String separator = ""])
 * Iterates over the given objects and writes them in sequence.
 * @description Tries to pass a list with elements that are null or aren't
 * Strings as argument, correct string conversion expected
 * @author msyabro
 */
import "../../../Utils/expect.dart";

class A {
  A() {}
  String toString() {
    return "class A";
  }
}

main() {
  StringBuffer sb = new StringBuffer();
  sb.writeAll([1, 2, 3]);
  Expect.equals("123", sb.toString());
  
  sb.clear();
  sb.writeAll([true, false]);
  Expect.equals("truefalse", sb.toString());
  
  sb.clear();
  sb.writeAll(["a", " ", null, " ", new A()]);
  Expect.equals("a null class A", sb.toString());
}
