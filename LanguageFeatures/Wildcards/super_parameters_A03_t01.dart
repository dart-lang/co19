// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Similarly to `this._` a `super._` does not introduce any
/// identifier into the scope of the initializer list.
///
/// @description Checks that a `super._`  does not introduce any identifier into
/// the scope of the initializer list.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

import '../../Utils/expect.dart';

const _ = 42;

class A {
  final x;
  const A(this.x);
}

class C extends A {
  final v;
  C(super._) : v = _;
  const C.cnst(super._) : this.v = _;
}

main() {
  Expect.equals(42, C(1).v);
  Expect.equals(42, C.cnst(2).v);
}
