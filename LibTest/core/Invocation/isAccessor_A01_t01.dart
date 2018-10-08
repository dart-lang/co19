/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool isAccessor
 * Whether the invocation was a getter or a setter call.
 * @description Checks that isAccessor returns true for getters and setters
 * invocations.
 * @author ilya
 */
import "../../../Utils/expect.dart";

@proxy
class D {

  get getOnly {}

  set setOnly (x) {}

  noSuchMethod(Invocation i) {
    Expect.isTrue(i.isAccessor);
  }

}

class C extends D {
  noSuchMethod(Invocation i) {
    Expect.isTrue(i.isAccessor);
  }
}

test(dynamic x) {
  x.foo;
  x.bar = 1;
  x.setOnly;
  x.getOnly = 1;
}

main() {
  test(new C());
}
