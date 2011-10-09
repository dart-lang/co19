/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The left-hand side of initialization expressions can be qualified with 'this'.
 * @description Checks that left-hand side of initialization expressions can be qualified with 'this'.
 * @author iefremov 
 * @reviewer msyabro
 */ 

class A {
  A() : this.v = 42 { }
  var v;
}


void main() {
  var a = new A();
  Expect.isTrue(a.v == 42);
}
