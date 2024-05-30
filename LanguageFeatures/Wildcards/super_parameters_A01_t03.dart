// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The positional formal parameter super._ is still allowed in
/// non-redirecting generative constructors. Such a parameter forwards the
/// argument's value to the super constructor invocation.
///
/// @description Checks that `super._` forwards the argument's value to the
/// super constructor invocation. Test optional parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

import '../../Utils/expect.dart';

class A {
  final x, _;
  const A([this.x = 1, this._ = 2]);
}

class C extends A {
  C([super._, super.x]);
  C.n([int super.z, int super._ = -1]);
  const C.cnst1([super._, super.x]);
  const C.cnst2([int super._ = -1, super.z]);
}

main() {
  Expect.equals(1, C().x);
  Expect.equals(2, C()._);
  Expect.equals(3, C(3, 4).x);
  Expect.equals(4, C(3, 4)._);

  Expect.equals(1, C.n().x);
  Expect.equals(-1, C.n()._);
  Expect.equals(5, C.n(5, 6).x);
  Expect.equals(6, C.n(5, 6)._);

  Expect.equals(1, const C.cnst1().x);
  Expect.equals(2, const C.cnst1()._);
  Expect.equals(7, const C.cnst1(7, 8).x);
  Expect.equals(8, const C.cnst1(7, 8)._);

  Expect.equals(-1, C.cnst2().x);
  Expect.equals(2, C.cnst2()._);
  Expect.equals(9, C.cnst2(9, 10).x);
  Expect.equals(10, C.cnst2(9, 10)._);
}
