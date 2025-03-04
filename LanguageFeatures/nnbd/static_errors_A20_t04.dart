// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is not an error for the body of a `late` field to reference
/// `this`.
///
/// @description Check that it is not an error for the body of a `late` field to
/// reference `this`.
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

class A {
  int one = 1;
}

class C extends A {
  int two = 2;
  late Function p1 = () => this.one;
  late final p2 = () {
    return this.two;
  };
}

main() {
  Expect.equals(1, new C().p1());
  Expect.equals(2, new C().p2());
}
