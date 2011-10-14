/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The left-hand side of initialization expressions always references 
 * instance fields. The right-hand side never references instance fields.
 * @description Tries to use instance field on the right using this.
 * @author iefremov 
 * @compile-error
 * @reviewer msyabro
 */ 

class C {
  C() : v = this.v {}
  var v;
}



main() {
  var c = new C();
}
