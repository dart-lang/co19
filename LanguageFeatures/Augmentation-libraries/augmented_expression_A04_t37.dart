// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting functions: Inside an augmenting function body (including
///   factory constructors but not generative constructors) `augmented` refers
///   to the augmented function. Tear-offs are not allowed, and this function
///   must immediately be invoked.
///
/// @description Checks that it is a compile-time error if an augmenting
/// function has a metadata named `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

const augmented = 0;

@augmented
void topLevelFunction() {}

augment @augmented void topLevelFunction() {}
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  C();
  @augmented
  factory C.f1() => C();
  @augmented
  static void staticMethod1() {}
  @augmented
  void instanceMethod1() {}
}

augment class C {
  augment @augmented factory C.f1() => C();
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented factory C.f2() => C();
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment @augmented static void staticMethod1() {}
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment @augmented void instanceMethod1() {}
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  @augmented static void staticMethod2() {}
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  @augmented void instanceMethod2() {}
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  @augmented
  static void staticMethod1() {}
  @augmented
  void instanceMethod1() {}
}

augment mixin M {
  augment @augmented static void staticMethod1() {}
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment @augmented void instanceMethod1() {}
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  @augmented static void staticMethod2() {}
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  @augmented void instanceMethod2() {}
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  @augmented
  static void staticMethod1() {}
  @augmented
  void instanceMethod1() {}
}

augment enum E {
  e1;
  augment @augmented static void staticMethod1() {}
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment @augmented void instanceMethod1() {}
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  @augmented static void staticMethod2() {}
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  @augmented void instanceMethod2() {}
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}
extension Ext on A {
  @augmented
  static void staticMethod1() {}
  @augmented
  void instanceMethod1() {}
}

augment extension Ext {
  augment @augmented static void staticMethod1() {}
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment @augmented void instanceMethod1() {}
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  @augmented static void staticMethod2() {}
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  @augmented void instanceMethod2() {}
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  @augmented
  factory ET.f() => ET(0);
  @augmented
  static void staticMethod1() {}
  @augmented
  void instanceMethod1() {}
}

augment extension type ET {
  augment @augmented factory ET.f1() => ET(1);
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented factory ET.f2() => ET(2);
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment @augmented static void staticMethod1() {}
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment @augmented void instanceMethod1() {}
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  @augmented static void staticMethod2() {}
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  @augmented void instanceMethod2() {}
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(topLevelFunction);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
