// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if V does not have a member named m.
///
/// @description Checks that it is a compile-time error to call a not-existing
/// member of an `inline` class
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

inline class BaseIC {
  final int id;
  BaseIC(this.id);
  foo() {}
}

abstract class BaseC {
  bar();
}

inline class IC implements BaseIC, BaseC {
  final int id;
  IC(this.id);
  foo() {}
  bar() {}
}

main() {
  IC ic = IC(42);
  ic.noGetter;
//   ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ic.noSetter = 0;
//   ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ic.noMethod();
//   ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ic + 1;
//   ^
// [analyzer] unspecified
// [cfe] unspecified

  ic.id;
  ic.foo();
  ic.bar();
}
