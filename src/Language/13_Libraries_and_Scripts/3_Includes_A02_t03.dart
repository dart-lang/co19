/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Compiling an include directive of the form #source(s); causes the Dart
 * system to attempt to compile the contents of the URI that is the value of s.
 * The top level declarations at that URI are then compiled by the Dart compiler
 * in the scope of the current library.
 * @description Checks that the top level declarations at URI are compiled in
 * the scope of the current library(including private declarations).
 * @author vasya
 * @reviewer msyabro
 */

#import("dart:math", prefix: "Math");

#source("source2.dart");

main() {
  //functions
  Expect.equals(null, foo());

  Expect.equals(3, bar(1,2));
  Expect.equals(13, bar(7,6));
  Expect.equals(33, bar(11,22));

  Expect.listEquals([], list(0));
  Expect.listEquals(new List(101), list(101));
  Expect.listEquals(new List(1000), list(1000));

  Expect.equals(0, _privateFunc());

  //function alias
  func ff = (bool bParam, [String sParam]) {};

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
  Expect.isTrue(-100 === i);
  Expect.isTrue(false === b);
  Expect.isTrue("string" === s);
  Expect.isTrue(Math.PI === pi);
  Expect.isTrue(const [0,1,2,3] === l);
  Expect.isTrue(const {'a': 1, 'b': 2} === m);
  Expect.isTrue("One" "Two" === e);
  Expect.isTrue('private' === _private);

  // class
  A a = new A();
  Expect.equals("A.FOO", A.FOO);
  Expect.equals("a.foo()", a.foo());
  Expect.equals("a.bar", a.bar);
  a.value = "a.value";
  Expect.equals("a.value", a.value);

  // interface
  I iImpl = new I();
  Expect.equals("I.FOO", I.FOO);
  Expect.equals("i.foo()", iImpl.foo());
  iImpl.value = "i.value";
  Expect.equals("i.value", iImpl.value);
}
