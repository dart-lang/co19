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
/// @description Checks that it is a compile-time error if a variable named
/// `augmented` is used within a control-flow element within the body of a
/// non-redirecting generative constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

var augmented = 0;

class C {
  C() {
    var list = [
      for (var augmented = 0; 1 > 2;) 0
    ];
    var map = {
      for (var i = 0; i > augmented;) i: i
    };
    var set = {
      if (1 > augmented) 42
    };
  }
  C.foo() {
    var list = [
      for (var augmented = 0; 1 > 2;) 0
    ];
    var map = {
      for (var i = 0; i > augmented;) i: i
    };
    var set = {
      if (1 > augmented) 42
    };
  }
}

augment class C {
  augment C() {
    var list = [
      for (var augmented = 0; 1 > 2;) 0
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    ];
    var map = {
      for (var i = 0; i > augmented;) i: i
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    var set = {
      if (1 > augmented) 42
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }
  augment C.foo() {
    var list = [
      for (var augmented = 0; 1 > 2;) 0
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    ];
    var map = {
      for (var i = 0; i > augmented;) i: i
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    var set = {
      if (1 > augmented) 42
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }
  C.bar() {
    var list = [
      for (var augmented = 0; 1 > 2;) 0
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    ];
    var map = {
      for (var i = 0; i > augmented;) i: i
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    var set = {
      if (1 > augmented) 42
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }
}

extension type ET(int id) {
  ET.foo(this.id) {
    var list = [
      for (var augmented = 0; 1 > 2;) 0
    ];
    var map = {
      for (var i = 0; i > augmented;) i: i
    };
    var set = {
      if (1 > augmented) 42
    };
  }
}

augment extension type ET {
  augment ET(int id) {
    var list = [
      for (var augmented = 0; 1 > 2;) 0
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    ];
    var map = {
      for (var i = 0; i > augmented;) i: i
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    var set = {
      if (1 > augmented) 42
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }
  ET.foo(this.id) {
    var list = [
      for (var augmented = 0; 1 > 2;) 0
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    ];
    var map = {
      for (var i = 0; i > augmented;) i: i
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    var set = {
      if (1 > augmented) 42
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }
  ET.bar(this.id) {
    var list = [
      for (var augmented = 0; 1 > 2;) 0
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    ];
    var map = {
      for (var i = 0; i > augmented;) i: i
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    var set = {
      if (1 > augmented) 42
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }
}

main() {
  print(C);
  print(ET);
}
