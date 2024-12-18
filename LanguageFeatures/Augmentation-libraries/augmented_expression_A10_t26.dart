// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a non-augmenting member declaration Dm that occurs
/// inside an augmenting type declaration Dt. A compile-time error occurs if the
/// identifier `augmented` occurs in Dm.
///
/// @description Checks that it is a compile-time error if an augmenting class
/// declaration extends a type that contains the name `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

class augmented {}
class A<T> {}

class C1 {}

augment class C1 extends augmented {}
//                       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C2 {}

augment class C2 extends A<augmented> {}
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(C1);
  print(C2);
}
