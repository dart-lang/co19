// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `S` be a class, `M` be a mixin with required superinterfaces
/// `T1, ..., Tn`, combined superinterface `MS`, implemented interfaces
/// `I1, ..., Ik` and members as member declarations, and let `N` be a name.
///
/// It is a compile-time error to apply `M` to `S` if `S` does not implement,
/// directly or indirectly, all of `T1, ..., Tn`.
///
/// @description Checks that it is not an error if a mixin is applied to a
/// class which does implement all required interfaces.
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

String console = "";

class A {
  bar(num n) {
    console = "A";
  }
}

class B extends A {
  bar(covariant int i) {
    console = "B";
  }
}

mixin M on A {
  test() {
    super.bar(3);
  }
}

class MA extends B with M {}

main() {
  new MA().test();
  Expect.equals("B", console);
}
