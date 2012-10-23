/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An include directive specifies a URI where a Dart compilation unit that should
 * be incorporated into the current library may be found.
 * include:
 * '#' 'source' '(' stringLiteral ')' ';'
 * ;
 * compilationUnit:
 *   topLevelDefinition* EOF
 * ;
 * A compilation unit is a sequence of top level declarations.
 * @description Checks that including a compilation unit with valid topLevelDefinitions
 * does not cause a compile-time errors.
 * @author vasya
 * @reviewer msyabro
 */

#import("dart:math", prefix: "Math");

#source("source2.dart");

main() {
  //functions

  /*//functions
  Expect.equals(null, foo());

  Expect.equals(3, bar(1,2));
  Expect.equals(13, bar(7,6));
  Expect.equals(33, bar(11,22));

  Expect.listEquals([], list(0));
  Expect.listEquals(new List(101), list(101));
  Expect.listEquals(new List(1000), list(1000));

  //function alias
  func ff = (bool b, [String s]) {};

  // get/set
  value = 1;
  Expect.equals(1, value);
  value = false;
  Expect.equals(false, value);
  value = "foo";
  Expect.equals("foo", value);
  value = foo();
  Expect.equals(null, value);
  value = [1,2,3,4];
  Expect.listEquals([1,2,3,4], value);

  // variables
  Expect.isTrue(identical(-100, i));
  Expect.isTrue(identical(false, b));
  Expect.isTrue(identical("string", s));
  Expect.isTrue(identical(Math.PI, pi));
  Expect.isTrue(identical(const [0,1,2,3], l));
  Expect.isTrue(identical(const {'a': 1, 'b': 2}, m));
  Expect.isTrue(identical("One" + "Two", e));

  // class
  A a = new A();
  Expect.equals("A.FOO", A.FOO);
  Expect.equals("a.foo()", a.foo());
  Expect.equals("a.bar", a.bar);
  a.value = "a.value";
  Expect.equals("a.value", a.value);

  // interface
  I i = new I();
  Expect.equals("I.FOO", I.FOO);
  Expect.equals("i.foo()", i.foo());
  i.value = "i.value";
  Expect.equals("i.value", i.value);   */
}
