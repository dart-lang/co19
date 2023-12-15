// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a dynamic type error if a factory returns an object whose
/// type is not a subtype of its actual return type.
///
/// @description Checks that it is a dynamic type error if a factory returns the
/// null object.
/// @author sgrekhov22@gmail.com

// Requirements=nnbd-strong

import "../../../../Utils/expect.dart";

class C {
  factory C() => null as dynamic;
}

enum E {
  e1, e2;
  const E();

  factory E.f() => null as dynamic;
}

main() {
  Expect.throws(() {
    C();
  });
  Expect.throws(() {
    E.f();
  });
}
