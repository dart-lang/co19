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
/// @description Checks that it is a compile-time error to declare a local
/// function named `augmented()` in the body of augmenting non-redirecting
/// generative constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

class C {
  C() {
    String augmented() => "Ok, non-augmenting declaration";
  }
  C.foo() {
    String augmented() => "Ok, non-augmenting declaration";
  }
}

augment class C {
  augment C() {
    String augmented() => "Error!";
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  augment C.foo() {
    String augmented() => "Error!";
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  C.bar() {
    String augmented() => "Error!";
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

extension type ET(String _) {
  ET.foo(this._) {
    String augmented() => "Ok, non-augmenting declaration";
  }
}

augment extension type ET {
  augment ET(int _) {
    String augmented() => "Error!";
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  augment ET.foo(this._) {
    String augmented() => "Error!";
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  ET.bar(this._) {
    String augmented() => "Error!";
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  print(C);
  print(ET);
}
