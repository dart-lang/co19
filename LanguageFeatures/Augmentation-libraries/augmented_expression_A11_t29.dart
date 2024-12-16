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
/// @description Checks that it is a compile-time error for an augmenting
/// non-redirecting generative constructor to use a variable named `augmented`
/// in the initializer list.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

const augmented = 1;

class C {
  int id;
  C(this.id);
}

augment class C {
  C.foo() : id = augmented;
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  a0(0);
  final int id;
  const E(this.id);
}

augment enum E {
  a1.foo();
  const E.foo() : id = augmented;
//                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int id) {}

augment extension type ET {
  ET.foo() : id = augmented;
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
  print(ET);
}
