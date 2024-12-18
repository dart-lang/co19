// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a non-augmenting member declaration Dm that occurs
/// inside an augmenting type declaration Dt. A compile-time error occurs if the
/// identifier `augmented` occurs in Dm.
///
/// @description Checks that it is a compile-time error if an augmenting
/// class-like declaration has a type parameter with a type bound named
/// `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

class augmented {}

class C<T extends augmented> {}

augment class C<T extends augmented> {}
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin M<T extends augmented> {}

augment class M<T extends augmented> {}
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum E<T extends augmented> {e0;}

augment enum E<T extends augmented> {e1;}
//                       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class A {}

extension Ext<T extends augmented> on A {}

augment extension Ext<T extends augmented> {}
//                              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET<augmented>(int _) {}

augment extension type ET<T extends augmented> {}
//                                  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
