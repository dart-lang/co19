/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An interface can specify the signatures of constructors that are used 
 * to provide objects that conform to the interface. It is a compile-time error if an
 * interface declares a constructor without declaring a factory class.
 * @description Checks that an interface can specify the signatures of constructors
 * (constant and named) as long as it declares a factory class.
 * @author vasya
 * @reviewer rodionov
 */

class A {
  factory I() {}
  factory I.fromInt(int value) {}
  factory I.fromString(String value) {}
  factory I.fromArray(List value) {}
  factory I.fromMany(int i, bool b, String s, List a) {}
  factory I.fromOptional(var v, [int i, bool b, String s]) {}
}

interface I default A {
  const I();
  I.fromInt(int value);
  I.fromString(String value);
  I.fromArray(List value);
  I.fromMany(int i, bool b, String s, List a);
  I.fromOptional(var v, [int i, bool b, String s]);
}

main() {
  new I();
  new I.fromInt(0);
  new I.fromString("String");
  new I.fromArray([1, 2]);
  new I.fromMany(1, true, "String", [1,2,3]);
  new I.fromOptional(1, b:false);
}
