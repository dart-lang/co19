/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a constructor has no body, and the initializer list consists 
 * solely of a call to another constructor (replacing the class-name with this) 
 * then the creation of the object is redirected to the called constructor.
 * @description Checks that constructor can not contain both body and redirection.
 * @author iefremov
 * @compile-error
 * @reviewer msyabro
 */


class A {
  A() : this.make(42, 6031769) {this.a = 42;};
  A.make(this.a, this.b) {}
  var a;
  var b;
}



main() {
   A a = new A();
}
