/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An argument definition test is an expression that tests whether 
 * a formal parameter is bound to an object explicitly passed to a method or function.
 * argumentDefinitionTest:
 *   `?' identifier
 * ;
 * It is a compile time error if v does not denote a formal parameter.
 * @description Checks that an argument definition test expression can be
 * nested as deeply as desired provided the argument being tested is visible there.
 * @author rodionov
 */

void foo([x]) {
  () {
    try {
      throw "hey!";
      Expect.fail("Unreachable code executed");
    } on String catch(str) {
      Expect.isFalse(?x);
    }
  }();
}

void bar([x]) {
  () {
    try {
      throw "hey!";
      Expect.fail("Unreachable code executed");
    } on String catch(str) {
      Expect.isTrue(?x);
    }
  }();
}

main() {
  foo();
  bar(null);
}
