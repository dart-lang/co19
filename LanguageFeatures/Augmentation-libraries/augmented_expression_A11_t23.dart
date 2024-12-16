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
/// @description Checks that it is a compile-time error to call a function with
/// a named parameter whose name is `augmented` in a body of a non-redirecting
/// generative constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

int test({int augmented = 0}) => augmented + 42;

class C {
  C() {
    test(augmented: 1);
  }
  C.foo() {
    test(augmented: 1);
  }
}

augment class C {
  augment C() {
    test(); // Ok
    test(augmented: 1);
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  augment C.foo() {
    test(); // Ok
    test(augmented: 1);
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  C.bar() {
    test(); // Ok
    test(augmented: 1);
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

extension type ET(int id) {
  ET.foo(this.id) {
    test(augmented: 1);
  }
}

augment extension type ET {
  augment ET(int id) {
    test(); // Ok
    test(augmented: 1);
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  augment ET.foo(this.id) {
    test(); // Ok
    test(augmented: 1);
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  ET.bar(this.id) {
    test(); // Ok
    test(augmented: 1);
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  print(C);
  print(ET);
}
