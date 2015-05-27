/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Map<Symbol, dynamic> namedArguments 
 * An unmodifiable view of the named arguments of the call.
 * If the member is a getter, setter or operator, the named arguments is empty.
 * @description Checks that namedArguments is unmodifiable and returns expected
 * results on getters, setters and instance methods invocations.
 * @static-warning
 * @author ilya
 * @issue 13714
 */
import "../../../Utils/expect.dart";

Map expect;

class D {
  method(x, y, z) {}
  get getOnly {}
  set setOnly (x) {}
  noSuchMethod(Invocation i) {
    Expect.throws(() => i.namedArguments.clear());
    Expect.mapEquals(expect, i.namedArguments);
  }
}

class C extends D {
  noSuchMethod(Invocation i) {
    Expect.throws(() => i.namedArguments.clear());
    Expect.mapEquals(expect, i.namedArguments);
  }
  test() {
    expect = {}; foo;
    expect = {}; bar = 1;
    expect = {}; setOnly;
    expect = {}; getOnly = 1;
    expect = {#foo:1, #bar:'baz'}; foo(foo:1, bar:'baz');
    expect = {#foo:1, #bar:'baz'}; method(foo:1, bar:'baz');
    expect = {}; super.foo;
    expect = {}; super.bar = 1;
    expect = {}; super.setOnly;
    expect = {}; super.getOnly = 1;
    expect = {#foo:1, #bar:'baz'}; super.foo(foo:1, bar:'baz');
    expect = {#foo:1, #bar:'baz'}; super.method(foo:1, bar:'baz');
  }
  var d;
  C() : d = new D();
}

main() {
  var x = new C();
  var y = new C();
  expect = {}; x+y;
  expect = {}; -x;
  expect = {}; x.foo;
  expect = {}; x.bar = 1;
  expect = {}; x.setOnly;
  expect = {}; x.getOnly = 1;
  expect = {#foo:1, #bar:'baz'}; x.foo(foo:1, bar:'baz');
  expect = {#foo:1, #bar:'baz'}; x.method(foo:1, bar:'baz');
  expect = {#foo:1, #bar:'baz'}; x.d(foo:1, bar:'baz');
  x.test();
}