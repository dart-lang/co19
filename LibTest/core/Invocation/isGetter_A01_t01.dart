/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool isGetter
 * Whether the invocation was a getter call. If so, both types of arguments is
 * empty.
 * @description Checks that isGetter returns true for getters invocations and
 * that arguments are empty.
 * @author ilya
 */
import "../../../Utils/expect.dart";

@proxy
class D {
  get getOnly {}
  set setOnly (x) {}
  noSuchMethod(Invocation i) {
    Expect.isTrue(i.isGetter);
    Expect.listEquals([], i.positionalArguments);
    Expect.mapEquals({}, i.namedArguments);
  }
}

class C extends D {
  noSuchMethod(Invocation i) {
    Expect.isTrue(i.isGetter);
    Expect.listEquals([], i.positionalArguments);
    Expect.mapEquals({}, i.namedArguments);
  }
}

main() {
  dynamic x = new C();
  x.foo;
  x.setOnly;
}