/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final List positionalArguments
 * An unmodifiable view of the positional arguments of the call.
 * If the member is a getter, the positional arguments is empty.
 * @description Checks that positionalArguments is unmodifiable and returns
 * expected results on getters, setters and instance methods invocations.
 * @author ilya
 * @issue 13714
 */
import "../../../Utils/expect.dart";

List expect;

class D {
  method(x, y, z) {}
  get getOnly {}
  set setOnly (x) {}
  noSuchMethod(Invocation i) {
    Expect.throws(() => i.positionalArguments.clear());
    Expect.listEquals(expect, i.positionalArguments);
  }
}

class C extends D {
  noSuchMethod(Invocation i) {
    Expect.throws(() => i.positionalArguments.clear());
    Expect.listEquals(expect, i.positionalArguments);
  }
  test() {
    expect = []; foo;
    expect = [1]; bar = 1;
    expect = []; setOnly;
    expect = [1]; getOnly = 1;
    expect = [1, 'baz']; foo(1, 'baz');
    expect = [1, 'baz']; method(1, 'baz');
    
    expect = []; super.foo;
    expect = [1]; super.bar = 1;
    expect = []; super.setOnly;
    expect = [1]; super.getOnly = 1;
    expect = [1, 'baz']; super.foo(1, 'baz');
    expect = [1, 'baz']; super.method(1, 'baz');
  }
  var d;
  C() : d = new D();
}

main() {
  var x = new C();
  var y = new C();
  expect = [y]; x+y;
  expect = []; -x;
  expect = []; x.foo;
  expect = [1]; x.bar = 1;
  expect = []; x.setOnly;
  expect = [1]; x.getOnly = 1;
  expect = [1, 'baz']; x.foo(1, 'baz');
  expect = [1, 'baz']; x.method(1, 'baz');
  expect = [1, 'baz']; x.d(1, 'baz');
  x.test();
}