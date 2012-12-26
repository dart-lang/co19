/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if an instance method m1 overrides an instance 
 * member m2 and the type of m1 is not a subtype of the type of m2.
 * @description Checks that a static warning is produced if m1 is not a subtype of m2
 * because their respective required parameter types are not mutually assignable.
 * @author iefremov
 * @reviewer pagolubev
 * @reviewer rodionov
 */

class A {
  foo(int x) {}
}

class C extends A {
  foo(String x) { /// static type warning
    return x.toString();
  }
}

main() {
  (new A()).foo(2);
  (new C()).foo("1");
}

