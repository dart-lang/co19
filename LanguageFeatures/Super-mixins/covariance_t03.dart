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
/// @description Checks that it is a run-time error when a mixin is applied
/// to a class that does not implement all required interfaces by using
/// `covariant` keyword. See
/// https://github.com/dart-lang/sdk/issues/35111#issuecomment-437291038
/// @author sgrekhov@unipro.ru
/// @issue 35111

import "../../Utils/expect.dart";

class A {
  bar(num n) {}
}

class B extends A {
  bar(covariant int i) {}
}

mixin M on A {
  test() {
    super.bar(3.14);
  }
}

class MA extends B with M {}

main() {
  Expect.throws(() {
    new MA().test();
  });
}
