// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a class, mixin class, enum, or
/// extension type has a primary constructor whose name is also the name of a
/// constructor declared in the body, or if it declares a primary constructor
/// whose name is `C.n`, and the body declares a static member whose basename is
/// `n`.
///
/// @description Check that it is not an error if an extension type has a
/// primary constructor whose name is `C.n`, and the body declares an instance
/// member whose basename is `n`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

extension type ET1.someName(int someName) {}

extension type ET2.someName(int v) {
  int get someName => v;
}

extension type ET3._someName(int v) {
  int _someName() => v;
}

int log = -1;

extension type ET4.someName(int v) {
  void set someName(int x) {
    log = x;
  }
}

main() {
  Expect.equals(1, ET1.someName(1).someName);
  Expect.equals(2, ET2.someName(2).someName);
  Expect.equals(3, ET3._someName(3)._someName());
  var c4 = ET4.someName(0);
  c4.someName = 4;
  Expect.equals(4, log);
}
