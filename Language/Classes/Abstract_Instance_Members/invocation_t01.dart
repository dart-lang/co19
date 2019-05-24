/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Invoking an abstract method, getter or setter results in an
 * invocation of noSuchMethod exactly as if the declaration did not exist,
 * unless a suitable member a is available in a superclass, in which case a is
 * invoked.
 * @description Checks that invoking an abstract method, getter or setter
 * results in a compile error.
 * @compile-error
 * @author kaigorodov, sgrekhov@unipro.ru
 */

class C {
  void m();       //# 01: compile-time error
  int get g;      //# 02: compile-time error
  set g(int v);   //# 03: compile-time error
}

main() {
  new C();
}
