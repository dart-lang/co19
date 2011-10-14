/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Redirection constructors can be invoked by subclasses in their initializer list.
 * @description Trivial check. 
 * @author iefremov
 * @reviewer msyabro
 */

class A {
  A() : this.named();
  A.named() {}
}

class B extends A {
  B() : super() {}
}



main() {
   B b = new B();
}
