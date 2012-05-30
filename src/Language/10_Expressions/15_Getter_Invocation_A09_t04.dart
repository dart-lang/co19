/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ???
 * @description Checks that static method cannot be read by super keyword.
 * @compile-error
 * @author kaigorodov
 */

class B {
  static void sm() {}
  void im() {}
}
class C extends B {
  getSMethod() { return super.sm; }
  getIMethod() { return super.im; }
}

main()  {
  C c=new C();
  c.getIMethod();
  c.getSMethod();
}
