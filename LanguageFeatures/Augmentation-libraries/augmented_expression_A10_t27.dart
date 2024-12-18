// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a non-augmenting member declaration Dm that occurs
/// inside an augmenting type declaration Dt. A compile-time error occurs if the
/// identifier `augmented` occurs in Dm.
///
/// @description Checks that it is a compile-time error if an augmenting mixin
/// declaration extends a type named `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

class augmented {}
class A<T> {}

mixin M1 {}

augment mixin M1 on augmented {}
//                  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin M2 {}

augment mixin M2 on A<augmented> {}
//                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
main() {
  print(M1);
  print(M2);
}
