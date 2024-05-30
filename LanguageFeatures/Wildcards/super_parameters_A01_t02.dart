// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The positional formal parameter super._ is still allowed in
/// non-redirecting generative constructors. Such a parameter forwards the
/// argument's value to the super constructor invocation.
///
/// @description Checks that `super._` forwards the argument's value to the
/// super constructor invocation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

import '../../Utils/expect.dart';

class A {
  final x, _;
  const A(this.x, this._);
}

class C extends A {
  C(super._, super.x);
  C.n(int super.z, int super._);
  const C.cnst1(super._, super.x);
  const C.cnst2(String super._, super.z);
}

main() {
  Expect.equals(1, C(1, 2).x);
  Expect.equals(2, C(1, 2)._);
  Expect.equals(3, C.n(3, 4).x);
  Expect.equals(4, C.n(3, 4)._);
  Expect.equals(5, const C.cnst1(5, 6).x);
  Expect.equals(6, const C.cnst1(5, 6)._);
  Expect.equals("7", C.cnst2("7", "8").x);
  Expect.equals("8", C.cnst2("7", "8")._);
}
