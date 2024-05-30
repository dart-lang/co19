// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The positional formal parameter super._ is still allowed in
/// non-redirecting generative constructors. Such a parameter forwards the
/// argument's value to the super constructor invocation.
///
/// @description Checks that `super._` forwards the argument's value to the
/// super constructor invocation, not to the current class.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

import '../../Utils/expect.dart';

class A {
  int x, y;
  A(this.x, this.y);
}

class C extends A {
  final _ = 0;
  C(super._, super.x);
  C.n(int super.z, int super._);
}

main() {
  Expect.equals(1, C(1, 2).x);
  Expect.equals(2, C(1, 2).y);
  Expect.equals(0, C(1, 2)._);
  Expect.equals(3, C.n(3, 4).x);
  Expect.equals(4, C.n(3, 4).y);
  Expect.equals(0, C.n(3, 4)._);
}
