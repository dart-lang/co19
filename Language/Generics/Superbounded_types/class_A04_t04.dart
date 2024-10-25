// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a parameterized type `T` is
/// super-bounded when it is used in any of the following ways:
/// ...
/// - `T` is an immediate subterm of an `extends` clause of a class, or it
/// occurs as an element in the type list of an `implements` clause, or a `with`
/// clause, or it occurs as an element in the type list of an `on` clause of a
/// mixin.
///
/// @description Checks that it is a compile-time error if a super-bounded type
/// occurs as an element in a type list of an `on` clause of a mixin.
/// @author sgrekhov22@gmail.com

class A<T extends A<T>> {}

mixin M1 on A {}
//          ^
// [analyzer] unspecified
// [cfe] unspecified

mixin M2 on A<dynamic> {}
//            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
mixin M3 on A<Object?> {}
//            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
mixin M4 on A<void> {}
//            ^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin M5 on A<A<dynamic>> {}
//            ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
mixin M6 on A<A<Object?>> {}
//            ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
mixin M7 on A<A<void>> {}
//            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(M1);
  print(M2);
  print(M3);
  print(M4);
  print(M5);
  print(M6);
  print(M7);
}
