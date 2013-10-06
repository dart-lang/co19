/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool isMethod
 * Whether the invocation was a method call.
 * @description Checks that isMethod returns false for getters and setters
 * invocations.
 * @static-warning
 * @author ilya
 */
import "../../../Utils/expect.dart";

class D {
  get getOnly {}
  set setOnly (x) {}
  noSuchMethod(Invocation i) {
    Expect.isFalse(i.isMethod);
  }
}

class C extends D {
  noSuchMethod(Invocation i) {
    Expect.isFalse(i.isMethod);
  }
  test() {
    foo;
    bar = 1;
    setOnly;
    getOnly = 1;
    super.foo;
    super.bar = 1;
    super.setOnly;
    super.getOnly = 1;
  }
}

main() {
  var x = new C();
  x.foo;
  x.bar = 1;
  x.setOnly;
  x.getOnly = 1;
  x.test();
}