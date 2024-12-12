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
/// non-redirecting generative constructor to have as an optional positional
/// parameter a record with a named field with the name `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

class C {
  C([({int augmented}) r = (augmented: 0)]);
  C.foo([({int augmented}) r = (augmented: 0)]);
}

augment class C {
  augment C([({int augmented}) r]) {}
//                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment C.foo([({int augmented}) r]) {}
//                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C.bar([({int augmented}) r = (augmented: 0)]) {}
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  a0(), a1.foo();
  const E([({int augmented}) r = (augmented: 0)]);
  const E.foo([({int augmented}) r = (augmented: 0)]);
}

augment enum E {
  a2.bar();
  augment const E([({int augmented}) r]);
//                       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.foo([({int augmented}) r]);
//                           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const E.bar([({int augmented}) r = (augmented: 0)]);
//                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int id) {
  ET.foo(this.id, [({int augmented}) r = (augmented: 0)]);
}

augment extension type ET {
  augment ET.foo(this.id, [({int augmented}) r]) {}
//                               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  ET.bar(this.id, [({int augmented}) r = (augmented: 0)]) {}
//                       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(ET);
}
