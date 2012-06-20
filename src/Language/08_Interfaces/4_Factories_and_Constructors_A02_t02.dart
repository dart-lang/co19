/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An interface can specify the signatures of constructors that are used 
 * to provide objects that conform to the interface. It is a compile-time error if an
 * interface declares a constructor without declaring a factory class.
 * @description Checks that different interfaces can declare the same factory class.
 * @author vasya
 * @reviewer rodionov
 */

class F {
  F() { }
  factory I() { return null; }
  factory J() { return null; }
}

interface I default F {
  I();
}

interface J default F {
  J();
}

main() {
  new I();
  new J();
}

