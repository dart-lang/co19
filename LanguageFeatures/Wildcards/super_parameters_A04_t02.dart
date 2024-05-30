// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Multiple `super._` and `this._` parameters can occur in the same
/// constructor without any name collision.
///
/// @description Checks that `this._` and multiple `super._` parameters can
/// occur in the same constructor without any name collision.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

import '../../Utils/expect.dart';

class A {
  final int x, y;
  A(this.x, [this.y = 0]);
}

class C extends A {
  final int _;
  String log = "";
  C(this._, super._, [super._]) {
    log = "_=$_, x=$x, y=$y";
  }
  C.n(this._, super._, [super._ = 1]) {
    log = "_=$_, x=$x, y=$y";
  }
}

main() {
  Expect.equals("_=1, x=2, y=3", C(1, 2, 3).log);
  Expect.equals("_=1, x=2, y=0", C(1, 2).log);
  Expect.equals("_=1, x=2, y=1", C.n(1, 2).log);
}
