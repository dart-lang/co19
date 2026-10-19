// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A check of the form `e == null` or of the form `e is Null` where
/// `e` has static type `T` promotes the type of `e` to `Null` in the `true`
/// continuation, and to `NonNull(T)` in the `false` continuation.
///
/// @description Check that `this` is promoted to `NonNull(this)` in the `false`
/// continuation.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

class C {
  foo() {}
}

mixin M {
  foo() {}
}

mixin class MC {
  foo() {}
}

enum E {
  e0;

  foo() {}
}

extension type ET(int _) {
  foo() {}
}

extension ExtC on C? {
  test1() {
    if (this == null) {
    } else {
      this.expectStaticType<Exactly<C>>();
      this.foo();
    }
  }

  test2() {
    if (this == null) {
    } else {
      expectStaticType<Exactly<C>>();
      foo();
    }
  }
}

extension ExtM on M? {
  test1() {
    if (this == null) {
    } else {
      this.expectStaticType<Exactly<M>>();
      this.foo();
    }
  }

  test2() {
    if (this == null) {
    } else {
      expectStaticType<Exactly<M>>();
      foo();
    }
  }
}

extension ExtMC on MC? {
  test1() {
    if (this == null) {
    } else {
      this.expectStaticType<Exactly<MC>>();
      this.foo();
    }
  }

  test2() {
    if (this == null) {
    } else {
      expectStaticType<Exactly<MC>>();
      foo();
    }
  }
}

extension ExtE on E? {
  test1() {
    if (this == null) {
    } else {
      this.expectStaticType<Exactly<E>>();
      this.foo();
    }
  }

  test2() {
    if (this == null) {
    } else {
      expectStaticType<Exactly<E>>();
      foo();
    }
  }
}

extension ExtET on ET? {
  test1() {
    if (this == null) {
    } else {
      this.expectStaticType<Exactly<ET>>();
      this.foo();
    }
  }

  test2() {
    if (this == null) {
    } else {
      expectStaticType<Exactly<ET>>();
      foo();
    }
  }
}

class MO = Object with M;

main() {
  C()..test1()..test2();
  MO()..test1()..test2();
  MC()..test1()..test2();
  E.e0..test1()..test2();
  ET(0)..test1()..test2();
}
