// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Case ⟨Setter: Mutable variable with declared type ⟩. A variable
/// declaration of one of the forms
/// • static? late? T id;
/// • static? late? T id = e;
/// implicitly induces a setter with the header void set id(T x), whose
/// execution sets the value of id to the incoming argument x.
///
/// @description Checks that it is a compile-time error to pass a parameter of
/// type `num` to implicit setter of type `int`
/// @author sgrekhov22@gmail.com

late int x1;
int? x2;
int x3 = 3;
late int x4 = 4;

class C {
  static late int v1;
  late int v2;
  int? v3;
  static int? v4;

  static late int v5 = 5;
  static int v6 = 6;
  late int v7 = 7;
  int v8 = 8;
}

main() {
  num n = 1;
  x1 = n;
//     ^
// [analyzer] unspecified
// [cfe] unspecified
  x2 = n;
//     ^
// [analyzer] unspecified
// [cfe] unspecified
  x3 = n;
//     ^
// [analyzer] unspecified
// [cfe] unspecified
  x4 = n;
//     ^
// [analyzer] unspecified
// [cfe] unspecified

  C c = C();
  C.v1 = n;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  c.v2 = n;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  c.v3 = n;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  C.v4 = n;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  C.v5 = n;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  C.v6 = n;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  c.v7 = n;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  c.v8 = n;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}
