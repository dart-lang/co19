// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if V does not have a member named m.
///
/// @description Checks that it is a compile-time error to call a not-existing
/// member of an extension type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type ET0(int id) {
  foo() {}
}

extension type ET(int id) implements ET0 {
  foo() {}
  bar() {}
}

main() {
  ET et = ET(42);
  et.noGetter;
//   ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  et.noSetter = 0;
//   ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  et.noMethod();
//   ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  et + 1;
//   ^
// [analyzer] unspecified
// [cfe] unspecified

  et.id;
  et.foo();
  et.bar();
}
