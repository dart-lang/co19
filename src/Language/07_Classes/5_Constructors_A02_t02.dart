/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If no constructor is specified for a class C, it implicitly has
 * a default constructor C() : super() {}, unless it is class Object.
 * @description Checks that implicit construct calls a super constructor.
 * @author vasya
 * @reviewer pagolubev
 * @reviewer iefremov
 */

class A {
  A() : i = 13;
  int i;
}

class C extends A {}

main() {
  Expect.equals(13, (new C()).i);
}
