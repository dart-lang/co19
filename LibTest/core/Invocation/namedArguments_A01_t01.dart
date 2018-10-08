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

@proxy
class C extends D {
  noSuchMethod(Invocation i) {
    Expect.throws(() => i.namedArguments.clear());
    Expect.mapEquals(expect, i.namedArguments);
  }
  var d;
  C() : d = new D();
}

test(dynamic x) {
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
}

main() {
  test(new C());
}