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
/// @description Checks that it is a compile-time error to use a type whose name
/// is `augmented` in `is` and `as` expressions within the body of a
/// non-redirecting generative constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

typedef augmented = Null;

class C {
  C() {
    print(null as augmented);
    print(null is augmented);
  }
  C.foo() {
    print(null as augmented);
    print(null is augmented);
  }
}

augment class C {
  augment C() {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  augment C.foo() {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  C.bar() {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

extension type ET(int id) {
  ET.foo(this.id) {
    print(null as augmented);
    print(null is augmented);
  }
}

augment extension type ET {
  augment ET(int id) {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  ET.foo(this.id) {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  ET.bar(this.id) {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  print(C);
  print(ET);
}
