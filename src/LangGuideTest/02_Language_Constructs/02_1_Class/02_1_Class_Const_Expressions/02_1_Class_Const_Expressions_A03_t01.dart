/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the superclass of some class with const constructor is not Object, the superclass must have a const 
 * constructor that is explicitly called from the initializer list of such constructor. 
 * @description Checks that calling non-const superclass constructor is not correct.
 * @author iefremov 
 * @compile-error 
 * @reviewer msyabro
 * @needsreview This test checks that const constructor must be in the super class 
 * not that calling non-const superclass constructor is not correct 
 */

class A {
  A() {}
}

class C extends A {
  const C() : super();
}
 
main() {
}
