/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An abstract method (respectively, abstract getter or abstract
 * setter) is an instance method, getter or setter that is not declared
 * external and does not provide an implementation.
 * @description Checks that instance method, getter or setter can not be
 * declared without providing an implementation.
 * @compile-error
 * @author kaigorodov
 */

class C {
  void m();       //# 01: compile-time error
  int get g;      //# 02: compile-time error
  set g(int v);   //# 03: compile-time error
}

main() {
  new C();
}
