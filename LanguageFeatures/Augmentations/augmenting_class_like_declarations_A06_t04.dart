// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The introductory declaration and augmenting declaration don't have the
///   same type parameters.
/// ...
/// When an augmentation must have the "same type parameters" as an
/// introductory declaration, that means:
/// - They must have the same number of type parameters (which may be zero).
/// - For each corresponding pair of type parameters:
///   - They must have the same name (same identifier).
///   - Their bounds must be the same type. This is after any omitted bound in
///     an introductory declaration has been given a default bound of `Object?`
///     and where any omitted bound in an augmentation has been inherited from
///     the introductory declaration.
///
/// @description Checks that it is a compile-time error if an introductory type
/// declaration omits the bound of a type parameter and an augmenting type
/// declaration specifies a bound other than `Object?`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C1<T> {}

augment class C1<T extends List<int>> {}
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C2<T> {}

augment class C2<T extends Object> {}
//                         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C3<T> {}

augment class C3<T extends dynamic> {}
//                         ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin M1<T> {}

augment mixin M1<T extends List<int>> {}
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin M2<T> {}

augment mixin M2<T extends Object> {}
//                         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin M3<T> {}

augment mixin M3<T extends dynamic> {}
//                         ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum E1<T> {
  e0;
}

augment enum E1<T extends List<int>> {
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  ;
}

enum E2<T> {
  e0;
}

augment enum E2<T extends Object> {
//                        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  ;
}

enum E3<T> {
  e0;
}

augment enum E3<T extends dynamic> {
//                        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  ;
}

class A {}

extension Ext1<T> on A {}

augment extension Ext1<T extends List<int>> {}
//                               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension Ext2<T> on A {}

augment extension Ext2<T extends Object> {}
//                               ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension Ext3<T> on A {}

augment extension Ext3<T extends dynamic> {}
//                               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET1<T>(int _) {}

augment extension type ET1<T extends List<int>> {}
//                                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET2<T>(int _) {}

augment extension type ET2<T extends Object> {}
//                                   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET3<T>(int _) {}

augment extension type ET3<T extends dynamic> {}
//                                   ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(C1);
  print(C2);
  print(C3);
  print(M1);
  print(M2);
  print(M3);
  print(E1);
  print(E2);
  print(E3);
  print(A);
  print(ET1);
  print(ET2);
  print(ET3);
}
