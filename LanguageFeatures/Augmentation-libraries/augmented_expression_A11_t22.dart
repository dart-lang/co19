// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting non-redirecting generative constructors: Unlike other
///   functions, `augmented` has no special meaning in non-redirecting
///   generative constructors. It is still a reserved word inside the body of
///   these constructors, since they are within the scope of an augmenting
///   declaration.
///
/// @description Checks that it is a compile-time error to augment a
/// non-redirecting generative constructor whose name is `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

class C1 {
  C1.augmented();
}

augment class C1 {
  augment C1.augmented() {}
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {}

augment class C2 {
  C2.augmented() {}
//   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1 {
  e0;
  const E1();
  const E1.augmented();
}

augment enum E1 {
  e1;
  augment const E1.augmented();
//                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 {
  e0;
  const E2();
}

augment enum E2 {
  e1;
  const E2.augmented();
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET1(int id) {
  ET1.augmented(this.id);
}

augment extension type ET1 {
  augment ET1.augmented(this.id) {}
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2(int id) {}

augment extension type ET2 {
  ET2.augmented(this.id) {}
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(E1);
  print(E2);
  print(ET1);
  print(ET2);
}
