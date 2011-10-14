/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returning an object whose type is not a subtype of A from 
 * factory constructor of class A is a dynamic type error.
 * @description Trivial check.
 * @author iefremov
 * @dynamic-type-error
 * @reviewer msyabro
 */

class A {
  factory A() {
    return new Object();
  }
}



main() {
   Object o = new A();
}
