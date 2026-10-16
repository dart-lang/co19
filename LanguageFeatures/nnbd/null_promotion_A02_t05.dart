// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A check of the form `e != null` or of the form `e is T` where `e`
/// has static type `T?` promotes the type of `e` to `T` in the `true`
/// continuation, and to `Null` in the `false` continuation.
///
/// @description Check that `this` is promoted to `NonNull(this)` in the `true`
/// continuation and to `Null` in the `false` continuation of `this != null`.
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
    } else {
      this.foo();
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }

  test2() {
    if (this != null) {
      foo();
    } else {
      foo();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

extension ExtM on M? {
  test1() {
    if (this != null) {
      this.foo();
    } else {
      this.foo();
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }

  test2() {
    if (this != null) {
      foo();
    } else {
      foo();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

extension ExtMC on MC? {
  test1() {
    if (this != null) {
      this.foo();
    } else {
      this.foo();
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }

  test2() {
    if (this != null) {
      foo();
    } else {
      foo();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

extension ExtE on E? {
  test1() {
    if (this != null) {
      this.foo();
    } else {
      this.foo();
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }

  test2() {
    if (this != null) {
      foo();
    } else {
      foo();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

extension ExtET on ET? {
  test1() {
    if (this != null) {
      this.foo();
    } else {
      this.foo();
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }

  test2() {
    if (this != null) {
      foo();
    } else {
      foo();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

main() {
  print(C);
  print(M);
  print(MC);
  print(E);
  print(ET);
}
