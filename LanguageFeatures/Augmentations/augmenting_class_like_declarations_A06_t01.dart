// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that it is a compile-time error if an augmenting type
/// declares wrong number of type parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C1<T> {}

augment class C1 {}
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

class C2<T> {}

augment class C2<T, X> {}
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

mixin M1<T> {}

augment mixin M1 {}
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

mixin M2<T> {}

augment mixin M2<T, X> {}
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

enum E1<T> {
  e1;
}

augment enum E1 {
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
  ;
}

enum E2<T> {
  e1;
}

augment enum E2<T, X> {
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
  ;
}

class A {}

extension Ext1<T> on A {}

augment extension Ext1 {}
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

extension Ext2<T> on A {}

augment extension Ext2<T, X> {}
//                ^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET1<T>(int _) {}

augment extension type ET1 {}
//                     ^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET2<T>(int _) {}

augment extension type ET2<T, X> {}
//                     ^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(C1);
  print(C2);
  print(M1);
  print(M2);
  print(E1);
  print(E2);
  print(A);
  print(ET1);
  print(ET2);
}
