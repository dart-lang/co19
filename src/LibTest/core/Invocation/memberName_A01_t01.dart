/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Symbol memberName
 * The name of the invoked expect.
 * @description Checks that memberName returns expected results on getters,
 * setters and instance methods invocations.
 * @author ilya
 */
import "../../../Utils/expect.dart";

Symbol expect;

class D {
  method(x, y, z) {}
  get getOnly {}
  set setOnly (x) {}
  noSuchMethod(Invocation i) {
    Expect.equals(expect, i.memberName);
  }
}

class C extends D {
  noSuchMethod(Invocation i) {
    Expect.equals(expect, i.memberName);
  }
  test() {
    expect = #foo; foo;
    expect = const Symbol('bar='); bar = 1;
    expect = #setOnly; setOnly;
    expect = const Symbol('getOnly='); getOnly = 1;
    
    expect = #foo; super.foo;
    expect = const Symbol('bar='); super.bar = 1;
    expect = #setOnly; super.setOnly;
    expect = const Symbol('getOnly='); super.getOnly = 1;
  }
  var d;
  C() : d = new D();
}

main() {
  var x = new C();
  var y = new C();
  expect = #+; x+y;
  expect = const Symbol('unary-'); -x;
  expect = #foo; x.foo;
  expect = const Symbol('bar='); x.bar = 1;
  expect = #setOnly; x.setOnly;
  expect = const Symbol('getOnly='); x.getOnly = 1;
  expect = #call; x.d();
  x.test();
}