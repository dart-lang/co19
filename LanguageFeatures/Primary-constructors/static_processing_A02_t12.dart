// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a class, mixin class, enum, or
/// extension type has a primary constructor whose name is also the name of a
/// constructor declared in the body, or if it declares a primary constructor
/// whose name is `C.n`, and the body declares a static member whose basename is
/// `n`.
///
/// @description Check that it is not an error if an enum has a primary
/// constructor whose name is `C.n`, and the body declares an instance member
/// whose basename is `n`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

enum E1.someName(final int v) {
  e0.someName(1);
  final int someName = 0;
}

enum E2.someName(final int v) {
  e0.someName(2);
  int get someName => v;
}

enum E3._someName(final int v) {
  e0._someName(3);
  int _someName() => v;
}

int log = -1;

enum E4.someName(final int v) {
  e0.someName(4);
  void set someName(int x) {
    log = x;
  }
}

main() {
  Expect.equals(0, E1.e0.someName);
  Expect.equals(2, E2.e0.someName);
  Expect.equals(3, E3.e0._someName());
  E4.e0.someName = 4;
  Expect.equals(4, log);
}
