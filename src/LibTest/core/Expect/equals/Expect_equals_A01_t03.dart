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
 */

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


check(bool cond) {
  if (!cond) throw "failed";
}

main() {
  B b = new B();
  check(b.checked === null);
  var a = new B();
  Expect.equals(b, a);
  check(b.checked === a);

  a = new A();
  Expect.equals(b, a);
  check(b.checked === a);

  try {
    Expect.equals(b, null);
  } catch (ExpectException ee) {
    check(b.checked === null);
  }

  Expect.equals(new A(), new C());

  try {
    Expect.equals(new C(), new C());
    check(false);
  } catch (ExpectException ok) {}
}
