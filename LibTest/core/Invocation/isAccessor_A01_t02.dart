// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion final bool isAccessor
/// Whether the invocation was a getter or a setter call.
/// @description Checks that isAccessor returns false for instance method
/// invocations.
/// @author ilya

import "../../../Utils/expect.dart";

class D {
  method(x, y, z) {}
  noSuchMethod(Invocation i) {
    Expect.isFalse(i.isAccessor);
  }
}

class C extends D {
  noSuchMethod(Invocation i) {
    Expect.isFalse(i.isAccessor);
  }
  var d;
  C() : d = new D();
}

test(dynamic x) {
  var y = new C();
  x + y;
  -x;
  x.foo();
  x.method();
  x.test();
  x.d();
}

main() {
  test(new C());
}
