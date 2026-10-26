// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static type of an expression `e!` is `NonNull(T)` where `T`
/// is the static type of `e`.
///
/// @description Check that the static type of an expression `this!` is `T` if
/// the static type of `this` is `T?`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

class C {
  void foo() {}
}

mixin M {
  void foo() {}
}

class MO = Object with M;

mixin class MC {
  void foo() {}
}

enum E {
  e0;

  void foo() {}
}

extension type ET(int _) {
  void foo() {}
}

extension ExtC on C? {
  test() {
    if (2 > 1) {
      this!.expectStaticType<Exactly<C>>();
    }
    this!.foo();
  }
}

extension ExtM on M? {
  test() {
    if (2 > 1) {
      this!.expectStaticType<Exactly<M>>();
    }
    this!.foo();
  }
}

extension ExtMC on MC? {
  test() {
    if (2 > 1) {
      this!.expectStaticType<Exactly<MC>>();
    }
    this!.foo();
  }
}

extension ExtE on E? {
  test() {
    if (2 > 1) {
      this!.expectStaticType<Exactly<E>>();
    }
    this!.foo();
  }
}

extension ExtET on ET? {
  test() {
    if (2 > 1) {
      this!.expectStaticType<Exactly<ET>>();
    }
    this!.foo();
  }
}

main() {
  C().test();
  MO().test();
  MC().test();
  E.e0.test();
  ET(0).test();
}
