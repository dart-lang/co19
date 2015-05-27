/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool isSetter
 * Whether the invocation was a setter call.
 * If so, arguments has exactly one positonal argument, and namedArguments is empty.
 * @description Checks that isSetter returns false for getters and instance methods
 * invocations.
 * @static-warning
 * @author ilya
 */
import "../../../Utils/expect.dart";

class D {
  method(x, y, z) {}
  get getOnly {}
  set setOnly (x) {}
  noSuchMethod(Invocation i) {
    Expect.isFalse(i.isSetter);
  }
}

class C extends D {
  noSuchMethod(Invocation i) {
    Expect.isFalse(i.isSetter);
  }
  test() {
    foo();
    method();
    foo;
    setOnly;
    super.foo();
    super.method();
    super.foo;
    super.setOnly;
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
  x.foo;
  x.setOnly;
  x.test();
  x.d();
}