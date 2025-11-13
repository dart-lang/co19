// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a class, mixin class, enum, or
/// extension type has a primary constructor whose name is also the name of a
/// constructor declared in the body, or if it declares a primary constructor
/// whose name is `C.n`, and the body declares a static member whose basename is
/// `n`.
///
/// @description Check that it is not an error if a mixin class has a primary
/// constructor whose name is `C.n`, and the body declares an instance member
/// whose basename is `n`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

import '../../Utils/expect.dart';

mixin class C1.someName() {
  int someName = 1;
}

mixin class C2.someName() {
  int get someName => 2;
}

mixin class C3._someName() {
  int _someName() => 3;
}

mixin class C4.someName() {
  int v = 0;
  void set someName(int x) {
    v = x;
  }
}

main() {
  Expect.equals(1, C1.someName().someName);
  Expect.equals(2, C2.someName().someName);
  Expect.equals(3, C3._someName()._someName());
  var c4 = C4.someName();
  c4.someName = 4;
  Expect.equals(4, c4.v);
}
