// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a non-augmenting member declaration Dm that occurs
/// inside an augmenting type declaration Dt. A compile-time error occurs if the
/// identifier `augmented` occurs in Dm.
///
/// @description Checks that it is a compile-time error if an augmenting
/// class-like declaration has a type parameter named `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

class C<augmented> {}

augment class C<augmented> {}
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin M<augmented> {}

augment class M<augmented> {}
//              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum E<augmented> {e0;}

augment enum E<augmented> {e1;}
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class A {}

extension Ext<augmented> on A {}

augment extension Ext<augmented> {}
//                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET<augmented>(int _) {}

augment extension type ET<augmented> {}
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
