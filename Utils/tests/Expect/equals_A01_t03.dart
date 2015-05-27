/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void equals(var expected, var actual, [String reason = null])
 * Checks whether the expected and actual values are equal (using [:==:]).
 * @description Checks that object equality is checked with == operator (on expected value).
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
    return b is B || b is A;
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
  var a = new B();
  Expect.equals(b, a);
  Expect.identical(b.checked, a);

  a = new A();
  Expect.equals(b, a);
  Expect.identical(b.checked, a);

  Expect.equals(new A(), new C());

  try {
    Expect.equals(new C(), new C());
    throw "ExpectException expected";
  } on ExpectException catch(ok) {}
}
