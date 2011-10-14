/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Classes are introduced by the class keyword.
 * @description Performs some obvious checks.
 * @author iefremov
 * @reviewer msyabro
 */

class A {
  A() {}
} 
class B {
  B() {}
}


main() {
  var a = new A();
  var b = new B();
}
