/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the superclass of some class with const constructor is not Object, the superclass must have a const 
 * constructor that is explicitly called from the initializer list of such constructor. 
 * @description Checks that calling Object constructor is not needed.
 * @author iefremov
 * @reviewer msyabro 
 */


class C extends Object {
  const C();
}

class A {
  const A();
}

class B extends A {
  const B() : super();
} 

main() {
  var b = new B();
}
