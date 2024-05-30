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

class A1 {
  final _;
  const A1(this._);
}

class A2 {
  final x;
  const A2(this.x);
}

class C1 extends A1 {
  C1([super._ = false]);
  C1.n([int super._ = -1]);
  const C1.cnst1([super._ = -1]);
  const C1.cnst2([String super._ = ""]);
}

class C2 extends A2 {
  C2(super._);
  C2.n(int super._);
  const C2.cnst1(super._);
  const C2.cnst2(String super._);
}

main() {
  Expect.equals(true, C1(true)._);
  Expect.equals(1, C1.n(1)._);
  Expect.equals(2, const C1.cnst1(2)._);
  Expect.equals("3", C1.cnst2("3")._);

  Expect.equals(true, C2(true).x);
  Expect.equals(1, C2.n(1).x);
  Expect.equals(2, const C2.cnst1(2).x);
  Expect.equals("3", C2.cnst2("3").x);
}
