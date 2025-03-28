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
/// non-redirecting generative constructor to declare a positional parameter
/// named `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

class C {
  C(int augmented);
  C.foo(int augmented);
}

augment class C {
  augment C(int augmented) {}
//              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment C.foo(int augmented) {}
//                  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C.bar(int augmented) {}
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  a0(0), a1.foo(1);
  const E(int augmented);
  const E.foo(int augmented);
}

augment enum E {
  a2.bar(2);
  augment const E(int augmented);
//                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.foo(int augmented);
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const E.bar(int augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int augmented) {
  ET.foo(this.augmented);
}

augment extension type ET {
  augment ET(int augmented) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.foo(this.augmented) {}
//                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  ET.bar(this.augmented) {}
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
  print(ET);
}
