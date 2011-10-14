/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a constructor has no body, and the initializer list consists 
 * solely of a call to another constructor (replacing the class-name with this) 
 * then the creation of the object is redirected to the called constructor.
 * @description Checks that initializer list can not contain both redirection and a field initializer.
 * @author iefremov
 * @compile-error
 * @reviewer msyabro
 */


class A {
  A() : this.make(42, 6031769), a(0);
  A.make(this.a, this.b) {}
  var a;
  var b;
}



main() {
   A a = new A();
}
