// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a non-augmenting member declaration Dm that occurs
/// inside an augmenting type declaration Dt. A compile-time error occurs if the
/// identifier `augmented` occurs in Dm.
///
/// @description Checks that it is a compile-time error if an augmenting
/// class-like declaration implements a type that contains the name `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

interface class augmented {}
class B extends augmented {}
class A<T> {}

class C {}

augment class C implements A<augmented> {}
//                           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin M  {}

augment mixin M implements A<augmented> {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

enum E {e0;}

augment enum E implements A<augmented> {e1;}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET(A<B> _) {}

augment extension type ET implements A<augmented> {}
//                                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(C);
  print(M);
  print(E);
  print(ET);
}
