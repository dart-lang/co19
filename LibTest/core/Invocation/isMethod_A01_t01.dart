/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool isMethod
 * Whether the invocation was a method call.
 * @description Checks that isMethod returns true for instance methods invocations.
 * @static-warning
 * @author ilya
 */
import "../../../Utils/expect.dart";

class D {
  method(x, y, z) {}
  noSuchMethod(Invocation i) {
    Expect.isTrue(i.isMethod);
  }
}

class C extends D {
  noSuchMethod(Invocation i) {
    Expect.isTrue(i.isMethod);
  }
  test() {
    foo();
    method();
    super.foo();
    super.method();
  }
  var d;
  C() : d = new D();
}

main() {
  var x = new C();
  var y = new C();
  x+y;
  -x;
  x.foo();
  x.method();
  x.test();
  x.d();
}