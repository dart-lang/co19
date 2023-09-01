// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Case ⟨Setter: Mutable variable with no declared type, with
/// initialization⟩.
/// A variable declaration of the form static? late? var id = e; implicitly
/// induces a setter with the header void set id(dynamic x), whose execution
/// sets the value of id to the incoming argument x.
/// Type inference could have provided a type different from dynamic.
///
/// @description Checks that the static type of an implicit setter of a mutable
/// variable with no declared type but with an initialization is provided by the
/// type inference. Test that it is a compile-time error to pass a parameter of
/// type `num` to implicit setter of type `int`
/// @author sgrekhov22@gmail.com

late var x1 = 1;
var x2 = 2;

class C {
  static late var v1 = 1;
  late var v2 = 2;
  var v3 = 3;
  static var v4 = 4;
}

main() {
  num n = 0;
  x1 = n;
//     ^
// [analyzer] unspecified
// [cfe] unspecified
  x2 = n;
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
}
