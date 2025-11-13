// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a class, mixin class, enum, or
/// extension type has a primary constructor whose name is also the name of a
/// constructor declared in the body, or if it declares a primary constructor
/// whose name is `C.n`, and the body declares a static member whose basename is
/// `n`.
///
/// @description Check that it is not an error if a class has a primary
/// constructor whose name is `C.n`, and the body declares an instance member
/// whose basename is `n`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

import '../../Utils/expect.dart';

class C1.someName(var int v) {
  int someName = 0;
}

class C2.someName(final int v) {
  int get someName => v;
}

class C3._someName(final int v) {
  int _someName() => v;
}

class C4.someName(var int v) {
  void set someName(int x) {
    v = x;
  }
}

main() {
  Expect.equals(0, C1.someName(1).someName);
  Expect.equals(2, C2.someName(2).someName);
  Expect.equals(3, C3._someName(3)._someName());
  var c4 = C4.someName(0);
  c4.someName = 4;
  Expect.equals(4, c4.v);
}
