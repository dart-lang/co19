// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Similarly to `this._`, and unlike for example `super.x`, a
/// `super._` does not introduce any identifier into the scope of the
/// initializer list.
///
/// @description Checks that a `super._`  does not introduce any identifier into
/// the scope of the initializer list.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

class A {
  final x;
  const A(this.x);
}

class C extends A {
  final v, _;
  C(this._, super._) : this.v = _;
//                              ^
// [analyzer] unspecified
// [cfe] unspecified
  const C.cnst(this.v, super._) : this._ = _;
//                                         ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
}
