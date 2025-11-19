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

// SharedOptions=--enable-experiment=primary-constructors

enum E1({required final String s = ""}) {
//                               ^
// [analyzer] unspecified
// [cfe] unspecified
  e0(s: "1");
}

enum E2({required this.s = ""}) {
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
  e0(s: "2");
  final String s;
}

enum E3({required String s = ""}) {
//                         ^
// [analyzer] unspecified
// [cfe] unspecified
  e0(s: "3");

  final String s;
}

main() {
  print(E1);
  print(E2);
  print(E3);
}
