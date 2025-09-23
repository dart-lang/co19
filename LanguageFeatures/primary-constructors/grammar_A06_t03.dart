// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a
/// `<defaultDeclaringNamedParameter>` has the modifier `required` as well as a
/// default value.
///
/// @description Check that it is a compile-time error if a
/// `<defaultDeclaringNamedParameter>` has the modifier `required` as well as a
/// default value. Test an enum.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

enum const E1(final int v, {required final String s = ""}) {
//                                                ^
// [analyzer] unspecified
// [cfe] unspecified
  e0(1, s: "");
}

enum E2 {
  e0(2, s: "");
  const this(final int v, {required String s = ""});
//                                         ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum const E3(final int v, {required this.s = ""}) {
//                                          ^
// [analyzer] unspecified
// [cfe] unspecified
  e0(3, s: "");
  final String s;
}

enum E4 {
  e0(4, s: "");

  const this(final int v, {required this.s = ""});
//                                         ^
// [analyzer] unspecified
// [cfe] unspecified
  final String s;
}

main() {
  print(E1);
  print(E2);
  print(E3);
  print(E4);
}
