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

@proxy
class C extends D {
  noSuchMethod(Invocation i) {
    Expect.throws(() => i.positionalArguments.clear());
    Expect.listEquals(expect, i.positionalArguments);
  }
  var d;
  C() : d = new D();
}

test(dynamic x) {
  var y = new C();
  expect = [y]; x + y;
  expect = []; -x;
  expect = []; x.foo;
  expect = [1]; x.bar = 1;
  expect = []; x.setOnly;
  expect = [2]; x.getOnly = 2;
  expect = [3, 'baz']; x.foo(3, 'baz');
  expect = [4, 'baz']; x.method(4, 'baz');
  expect = [5, 'baz']; x.d(5, 'baz');
}

main() {
  test(new C());
}