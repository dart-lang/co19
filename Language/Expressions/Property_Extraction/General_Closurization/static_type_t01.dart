/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of i is:
 * • The static type of function T.m, if T has an accessible instance member
 * named m.
 * • The static type of function T.m, if T is Type, e is a constant type
 * literal and the class corresponding to e declares an accessible static
 * member or constructor named m.
 * • The type dynamic otherwise.
 * @description Check that static type of extracted method is Function
 * @static-clean
 * @author sgrekhov@unipro.ru
 */

class C {
  void m(int val) {}
}

main() {
  C o = new C();
  Function i1 = o#m;
}
