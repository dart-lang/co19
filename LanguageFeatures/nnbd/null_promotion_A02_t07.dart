// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A check of the form `e != null` or of the form `e is T` where `e`
/// has static type `T?` promotes the type of `e` to `T` in the `true`
/// continuation, and to `Null` in the `false` continuation.
///
/// @description Check that `this` is promoted to `T` in the `true` continuation
/// and to `Null` in the `false` continuation of `this is T`.
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
    if (this is C) {
      this.expectStaticType<Exactly<C>>();
      this.foo();
    } else {
      this.expectStaticType<Exactly<Null>>();
      this.foo();
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }

  test2() {
    if (this is C) {
      expectStaticType<Exactly<C>>();
      foo();
    } else {
      expectStaticType<Exactly<Null>>();
      foo();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

extension ExtM on M? {
  test1() {
    if (this is M) {
      this.expectStaticType<Exactly<M>>();
      this.foo();
    } else {
      this.expectStaticType<Exactly<Null>>();
      this.foo();
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }

  test2() {
    if (this is M) {
      expectStaticType<Exactly<M>>();
      foo();
    } else {
      expectStaticType<Exactly<Null>>();
      foo();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

extension ExtMC on MC? {
  test1() {
    if (this is MC) {
      this.expectStaticType<Exactly<MC>>();
      this.foo();
    } else {
      this.expectStaticType<Exactly<Null>>();
      this.foo();
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }

  test2() {
    if (this is MC) {
      expectStaticType<Exactly<MC>>();
      foo();
    } else {
      expectStaticType<Exactly<Null>>();
      foo();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

extension ExtE on E? {
  test1() {
    if (this is E) {
      this.expectStaticType<Exactly<E>>();
      this.foo();
    } else {
      this.expectStaticType<Exactly<Null>>();
      this.foo();
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }

  test2() {
    if (this is E) {
      expectStaticType<Exactly<E>>();
      foo();
    } else {
      expectStaticType<Exactly<Null>>();
      foo();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

extension ExtET on ET? {
  test1() {
    if (this is ET) {
      this.expectStaticType<Exactly<ET>>();
      this.foo();
    } else {
      this.expectStaticType<Exactly<Null>>();
      this.foo();
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }

  test2() {
    if (this is ET) {
      expectStaticType<Exactly<ET>>();
      foo();
    } else {
      expectStaticType<Exactly<Null>>();
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
