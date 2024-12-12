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
/// @description Checks that it is a compile-time error to call an `augmented()`
/// expression in the body of an augmenting non-redirecting generative
/// constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

class C {
  C();
  C.foo();
  String augmented() => "Ok, non-augmenting declaration";
}

augment class C {
  augment C() {
    augmented();
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  augment C.foo() {
    augmented();
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  C.bar() {
    augmented();
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

extension type ET1(String _) {
  ET1.foo(this._) {
    augmented("Ok, non-augmenting declaration");
  }
  void augmented(String _) {}
}

augment extension type ET1 {
  augment ET1(int _) {
    augmented("Error!");
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  augment ET1.foo(this._) {
    augmented("Error!");
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  ET1.bar(this._) {
    augmented("Error!");
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

extension type ET2.foo(String _) {
  ET2.new(this._) {
    augmented("Ok, non-augmenting declaration");
  }
  void augmented(String _) {}
}

augment extension type ET2 {
  augment ET2.foo(this._) {
    augmented("Error!");
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  augment ET2(this._) {
    augmented("Error!");
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  print(C);
  print(ET1);
  print(ET2);
}
