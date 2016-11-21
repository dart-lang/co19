/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void notEquals(var unexpected, var actual, [String reason = null])
 * Checks whether the unexpected and actual values are not equal (using [:!=:]).
 * @description Checks that object equality is checked with == operator (on unexpected value).
 * @author varlax
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";

class A {
  operator ==(var b) {
    return true;
  }
}

class B {
  var checked;
  operator ==(var b) {
    checked = b;
    return b is B;
  }
}

class C {
  operator ==(var b) {
    return false;
  }
}

main() {
  B b = new B();
  Expect.identical(b.checked, null);
  var a1 = new A();
  Expect.notEquals(b, a1);
  Expect.identical(b.checked, a1);

  var a2 = new C();
  Expect.notEquals(b, a2);
  Expect.identical(b.checked, a2);

  var a3 = new B();
  try {
    Expect.notEquals(b, a3);
    throw new Exception("ExpectException expected");
  } on ExpectException {
  }
  Expect.identical(b.checked, a3);

  Expect.notEquals(new C(), new A());

  try {
    Expect.notEquals(new A(), new C());
    throw new Exception("ExpectException expected");
  } on ExpectException {}
}
