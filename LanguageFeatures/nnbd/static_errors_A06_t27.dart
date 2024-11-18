// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error if a mixin declaration or a class declaration with
/// no generative constructors declares an instance variable without an
/// initializing expression which is final or whose type is potentially
/// non-nullable, unless the variable is marked with a `late`, `abstract`, or
/// `external` modifier.
///
/// @description Check that it is an error if a mixin declaration or a class
/// declaration with no generative constructors declares an instance variable
/// without an initializing expression which is final.
/// @author sgrekhov22@gmail.com

class C<T extends Object?> {
  final v1;
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
  final dynamic v2;
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
  final Object? v3;
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
  final Null v4;
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
  final void v5;
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
  final T? v6;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M<T> {
  final v1;
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
  final dynamic v2;
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
  final Object? v3;
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
  final Null v4;
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
  final void v5;
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
  final T? v6;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
}
