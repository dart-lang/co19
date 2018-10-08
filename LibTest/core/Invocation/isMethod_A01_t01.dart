/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool isMethod
 * Whether the invocation was a method call.
 * @description Checks that isMethod returns true for instance methods
 * invocations.
 * @author ilya
 */
import "../../../Utils/expect.dart";

@proxy
class D {
  method(x, y, z) {}
  noSuchMethod(Invocation i) {
    Expect.isTrue(i.isMethod);
  }
}

@proxy
class C extends D {
  noSuchMethod(Invocation i) {
    Expect.isTrue(i.isMethod);
  }
  var d;
  C() : d = new D();
}

test(dynamic x) {
  var y = new C();
  x + y;
  - x;
  x.foo();
  x.method();
  x.d();
}

main() {
  test(new C());
}