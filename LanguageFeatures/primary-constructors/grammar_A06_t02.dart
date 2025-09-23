// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a
/// `<defaultDeclaringNamedParameter>` has the modifier `required` as well as a
/// default value.
///
/// @description Check that it is a compile-time error if a
/// `<defaultDeclaringNamedParameter>` has the modifier `required` as well as a
/// default value. Test an extension type.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

extension type A(int v) implements Object {}

extension type ET1(int v) {
  this.someName(this.v, {required String s = ""});
//                                         ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2._(final A v) implements A {
  const this(final this.v, {required final String s = ""});
//                                                ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET1);
  print(ET2);
}
