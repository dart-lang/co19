/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An abstract method (respectively, abstract getter or abstract
 * setter) is an instance method, getter or setter that is not declared
 * external and does not provide an implementation.
 * @description Checks that instance method, getter or setter can be declared
 * without providing an implementation.
 * @static-warning
 * @author kaigorodov
 * @reviewer rodionov
 */

class C {
  void m();   /// static type warning
  int get g;    /// static type warning
  set g(int v);   /// static type warning
}

main() {
  C c = new C();
}
