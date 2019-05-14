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
 * Let C be a class. It is no compile-time error if C declares a
 * • static member with basename n, and has an instance member with basename n.
 *
 * @description Checks that it is no compile-time error when a class declares
 * an instance method with the same name as an inaccessible static field in its
 * superclass.
 * @author kaigorodov
 */
import "same_name_static_member_in_superclass_lib.dart";

class C extends A {
  bool _f(int x, [String xx]) {
    return x == x;
  }
}

main() {
  new C()._f(1, "");
}
