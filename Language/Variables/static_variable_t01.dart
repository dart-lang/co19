/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A static variable is a variable that is not associated with
 * a particular instance, but rather with an entire library or class. Static
 * variables include library variables and class variables. Class variables
 * are variables whose declaration is immediately nested inside a class
 * declaration and includes the modifer static.
 * A library variable is implicitly static. It is a compile-time error to
 * preface a top-level variable declaration with the built-in identier static.
 * @description Checks that a static variable is not associated with a
 * particular instance.
 * @author kaigorodov
 * @reviewer iefremov
 */
import "../../Utils/expect.dart";

class Cl {
  static var _foo;
  int get foo {
    return _foo;
  }
  void set foo(int val) {
    _foo = val;
  }
}

main() {
  Cl c1 = new Cl();
  Cl c2 = new Cl();
  c2.foo = 1;
  Expect.equals(1, c1.foo);
  c2.foo = 2;
  Expect.equals(2, c1.foo);
}
