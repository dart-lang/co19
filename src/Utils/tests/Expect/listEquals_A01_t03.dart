/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void listEquals(List expected, List actual, [String reason = null])
 * Checks that all elements in [expected] and [actual] are equal [:==:].
 * @description Checks that operator == on elements is used for checking.
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
  operator ==(var b) {
    return b is B || b is A;
  }
}

class C {
  operator ==(var b) {
    return false;
  }
}

main() {
  Expect.listEquals([new A(),new B()], [new B(), new A()]);

  try {
    var c = new C();
    Expect.listEquals([c], [c]);
    throw "ExpectException expected";
  } on ExpectException catch(ee) {
  }
}
