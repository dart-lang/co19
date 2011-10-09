/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Constructor initializers are required to initialize the super class and constant fields.
 * @description Checks that superclass must be initialized in initializer.
 * @author iefremov 
 * @compile-error
 * @reviewer msyabro
 */ 

class A {
  A() {} 
}

class C extends A {
  C() {}
}

void main() {
  C c = new C();
}
