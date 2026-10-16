// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A check of the form `e != null` or of the form `e is T` where `e`
/// has static type `T?` promotes the type of `e` to `T` in the `true`
/// continuation, and to `Null` in the `false` continuation.
///
/// @description Check that `this` is promoted to `NonNull(this)` in the `true`
/// continuation of `this != null`.
/// @author sgrekhov22@gmail.com

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
    if (this != null) {
      this.foo();
    }
  }

  test2() {
    if (this != null) {
      foo();
    }
  }
}

extension ExtM on M? {
  test1() {
    if (this != null) {
      this.foo();
    }
  }

  test2() {
    if (this != null) {
      foo();
    }
  }
}

extension ExtMC on MC? {
  test1() {
    if (this != null) {
      this.foo();
    }
  }

  test2() {
    if (this != null) {
      foo();
    }
  }
}

extension ExtE on E? {
  test1() {
    if (this != null) {
      this.foo();
    }
  }

  test2() {
    if (this != null) {
      foo();
    }
  }
}

extension ExtET on ET? {
  test1() {
    if (this != null) {
      this.foo();
    }
  }

  test2() {
    if (this != null) {
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
