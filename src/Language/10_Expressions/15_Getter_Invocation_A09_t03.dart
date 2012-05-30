/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ???
 * @description Checks that static field cannot be read by super keyword.
 * @compile-error
 * @author kaigorodov
 */

class B {
  static var sf;
  var i_f;
}
class C extends B {
  getSField() { return super.sf; }
  getIField() { return super.i_f; }
}

main()  {
  C c=new C();
  c.getIField();
  c.getSField();
}
