// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The type parameters of the augmenting declaration do not match the
///   augmented declarations's type parameters. This means there must be the
///   same number of type parameters with the exact same type parameter names
///   (same identifiers) and bounds if any (same types, even if they may not be
///   written exactly the same in case one of the declarations needs to refer to
///   a type using an import prefix).
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
