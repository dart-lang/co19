/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An interface may contain getter and/or setter signatures.
 * These are subject to the same compile-time and static checking rules 
 * as getters and setters in classes.
 * 7.2: It is a compile-time error if a getter's formal parameter list is not empty.
 * @description Checks that it is a compile-time error if an interface declares a getter
 * with required parameter(s).
 * @author vasya
 * @compile-error
 * @reviewer rodionov
 */

interface I  {
  int get getA(var v);
}

class A implements I {}

main() {
  try {
    new A();
  } catch(var e) {}
}

