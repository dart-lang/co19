/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Instance methods are functions (9) whose declarations are
 * immediately contained within a class declaration and that are not declared
 * static. The instance methods of a class C are those instance methods declared
 * by C and the instance methods inherited by C from its superclass.
 * . . .
 * A method declaration may conflict with other declarations (10.11).
 * Let C be a class. It is a compile-time error if C declares a
 * • constructor named C.n and a static member with basename n.
 * • getter or a setter with basename n, and has a method named n.
 * • method named n, and has a getter or a setter with basename n.
 * • static member with basename n, and has an instance member with basename n.
 *
 * @description Checks that it is not a compile-error when a class declares
 * an instance method with the same name as a static getter in its superclass.
 * @issue 27476
 * @author iefremov
 */

class A {
  static get f {}
}

class C extends A {
  f() {
  }
}

main() {
  new C().f();
}
