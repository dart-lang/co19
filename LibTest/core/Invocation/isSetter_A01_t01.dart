/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool isSetter
 * Whether the invocation was a setter call.
 * If so, arguments has exactly one positonal argument, and namedArguments is
 * empty.
 * @description Checks that isSetter returns true for setters invocations and
 * arguments are as expected.
 * @author ilya
 */
import "../../../Utils/expect.dart";

class D {
  get getOnly {}
  set setOnly (x) {}
  noSuchMethod(Invocation i) {
    Expect.isTrue(i.isSetter);
    Expect.equals(1, i.positionalArguments.length);
    Expect.mapEquals({}, i.namedArguments);
  }
}

@proxy
class C extends D {
  noSuchMethod(Invocation i) {
    Expect.isTrue(i.isSetter);
    Expect.equals(1, i.positionalArguments.length);
    Expect.mapEquals({}, i.namedArguments);
  }
}

main() {
  dynamic x = new C();
  x.bar = 1;
  x.getOnly = 1;
}