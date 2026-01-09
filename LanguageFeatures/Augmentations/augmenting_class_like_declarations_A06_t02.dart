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
/// declares type parameters with different bounds.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class A {}
class B extends A {}

class C1<T extends A> {}

augment class C1<T extends B> {}
//                         ^
// [analyzer] unspecified
// [cfe] unspecified

class C2<T extends A> {}

augment class C2<T extends Object> {}
//                         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C3<T extends A> {}

augment class C3<T extends List> {}
//                         ^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin M1<T extends A> {}

augment mixin M1<T extends B> {}
//                         ^
// [analyzer] unspecified
// [cfe] unspecified

mixin M2<T extends A> {}

augment mixin M2<T extends Object> {}
//                         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin M3<T extends A> {}

augment mixin M3<T extends List> {}
//                         ^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum E1<T extends A> {
  e1;
}

augment enum E1<T extends B> {
//                        ^
// [analyzer] unspecified
// [cfe] unspecified
  ;
}

enum E2<T extends A> {
  e1;
}

augment enum E2<T extends Object> {
//                        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  ;
}

enum E3<T extends A> {
  e1;
}

augment enum E3<T extends List> {
//                        ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  ;
}

class D {}
extension Ext1<T extends A> on D {}

augment extension Ext1<T extends B> {}
//                               ^
// [analyzer] unspecified
// [cfe] unspecified

extension Ext2<T extends A> on D {}

augment extension Ext2<T extends Object> {}
//                               ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension Ext3<T extends A> on D {}

augment extension Ext3<T extends List> {}
//                               ^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET1<T extends A>(int _) {}

augment extension type ET1<T extends B> {}
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET2<T extends A>(int _) {}

augment extension type ET2<T extends Object> {}
//                                   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET3<T extends A>(int _) {}

augment extension type ET3<T extends List> {}
//                                   ^^^^
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
  print(D);
  print(ET1);
  print(ET2);
  print(ET3);
}
