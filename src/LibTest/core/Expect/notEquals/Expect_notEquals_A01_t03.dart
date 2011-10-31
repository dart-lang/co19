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


check(bool cond) {
  if (!cond) throw "failed";
}

main() {
  B b = new B();
  check(b.checked === null);
  var a = new A();
  Expect.notEquals(b, a);
  check(b.checked === a);

  Expect.notEquals(b, null);
  check(b.checked === null);

  a = new C();
  Expect.notEquals(b, a);
  check(b.checked === a);

  a = new B();
  try {
    Expect.notEquals(b, a);
    check(false);
  } catch (ExpectException ee) {
    check(b.checked === a);
  }

  Expect.notEquals(new C(), new A());

  try {
    Expect.notEquals(new A(), new C());
    check(false);
  } catch (ExpectException ok) {}
}
