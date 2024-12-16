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
/// @description Checks that it is a compile-time error to use `augmented` as a
/// constant value in switch expressions and statements within the body of a
/// non-redirecting generative constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

const augmented = "Constant augmented, shouldn't be used";

class C {
  C() {
    switch ("") {
      case augmented:
      default:
    }
    var x = switch("") {
      augmented => 1,
      _ => 0
    };
  }
  C.foo() {
    switch ("") {
      case augmented:
      default:
    }
    var x = switch("") {
      augmented => 1,
      _ => 0
    };
  }
}

augment class C {
  augment C() {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
  }
  augment C.foo() {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
  }
  C.bar() {
    switch ("") {
      case augmented:
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      default:
    }
    var x = switch("") {
      augmented => 1,
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      _ => 0
    };
  }
}

extension type ET(int id) {
  ET.foo(this.id) {
    switch ("") {
      case augmented:
      default:
    }
    var x = switch("") {
      augmented => 1,
      _ => 0
    };
  }
}

augment extension type ET {
  augment ET(int id) {
    print((augmented: 1));
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  augment ET.foo(this.id) {
    print((augmented: 1));
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  ET.bar(this.id) {
    print((augmented: 1));
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  print(C);
  print(ET);
}
