// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A check of the form `e == null` or of the form `e is Null` where
/// `e` has static type `T` promotes the type of `e` to `Null` in the `true`
/// continuation, and to `NonNull(T)` in the `false` continuation.
///
/// @description Check that `this` is promoted to `Null` in the `true`
/// continuation and to `NonNull(T)` in the `false` continuation of
/// `this is Null`.
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
    if (this is Null) { // ignore: type_check_with_null
      this.expectStaticType<Exactly<Null>>();
      this.foo();
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
    } else {
      this.expectStaticType<Exactly<C>>();
      this.foo();
    }
  }

  test2() {
    if (this is Null) { // ignore: type_check_with_null
      expectStaticType<Exactly<Null>>();
      foo();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
    } else {
      expectStaticType<Exactly<C>>();
      foo();
    }
  }
}

extension ExtM on M? {
  test1() {
    if (this is Null) { // ignore: type_check_with_null
      this.expectStaticType<Exactly<Null>>();
      this.foo();
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
    } else {
      this.expectStaticType<Exactly<M>>();
      this.foo();
    }
  }

  test2() {
    if (this is Null) { // ignore: type_check_with_null
      expectStaticType<Exactly<Null>>();
      foo();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
    } else {
      expectStaticType<Exactly<M>>();
      foo();
    }
  }
}

extension ExtMC on MC? {
  test1() {
    if (this is Null) { // ignore: type_check_with_null
      this.expectStaticType<Exactly<Null>>();
      this.foo();
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
    } else {
      this.expectStaticType<Exactly<MC>>();
      this.foo();
    }
  }

  test2() {
    if (this is Null) { // ignore: type_check_with_null
      expectStaticType<Exactly<Null>>();
      foo();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
    } else {
      expectStaticType<Exactly<MC>>();
      foo();
    }
  }
}

extension ExtE on E? {
  test1() {
    if (this is Null) { // ignore: type_check_with_null
      this.expectStaticType<Exactly<Null>>();
      this.foo();
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
    } else {
      this.expectStaticType<Exactly<E>>();
      this.foo();
    }
  }

  test2() {
    if (this is Null) { // ignore: type_check_with_null
      expectStaticType<Exactly<Null>>();
      foo();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
    } else {
      expectStaticType<Exactly<E>>();
      foo();
    }
  }
}

extension ExtET on ET? {
  test1() {
    if (this is Null) { // ignore: type_check_with_null
      this.expectStaticType<Exactly<Null>>();
      this.foo();
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
    } else {
      this.expectStaticType<Exactly<ET>>();
      this.foo();
    }
  }

  test2() {
    if (this is Null) { // ignore: type_check_with_null
      expectStaticType<Exactly<Null>>();
      foo();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
    } else {
      expectStaticType<Exactly<ET>>();
      foo();
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
