// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We infer the type of a parameter declaration, p, of a
/// non-redirecting generative constructor, C, as:
/// ...
/// Otherwise the inferred type of the parameter is dynamic
///
/// @description Check that the inferred type of the parameter is dynamic if
// /// there is no information about the parameter type
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

class C<T> {
  var x;
  T t;
  C(var v, this.x, this.t) {
    Expect.throws(() {
      testType(v);
    });
  }
}

testType(String s) {}

test(var v) {
  var c = C(v, v, v);
  Expect.throws(() {
    testType(c.x);
  });
  Expect.throws(() {
    testType(c.t);
  });
}

main() {
  test(42);
}
