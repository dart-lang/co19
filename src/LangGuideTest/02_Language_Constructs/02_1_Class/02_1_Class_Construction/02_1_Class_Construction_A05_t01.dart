/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The super initializer can be anywhere in the initializer list.
 * @description Checks various positions of the super initializer.
 * @author iefremov
 * @reviewer msyabro 
 */ 

class Super {
  Super() {}
}

class C extends Super {
  C() : super(), v1 = null, v2 = null {}
  C.c2() : v1 = null, super(), v2 = null {}
  C.c3() : v1 = null, v2 = null, super() {}

  var v1;
  var v2;
}

void main() {
  C c = new C();
  c = new C.c2();
  c = new C.c3();
}
