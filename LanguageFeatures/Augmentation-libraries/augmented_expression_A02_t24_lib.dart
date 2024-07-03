// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting setters: Within an augmenting setter `augmented` must be
///   followed by an `=` and will directly invoke the augmented setter. If
///   augmenting a field with a setter, this will invoke the implicit setter
///   from the augmented field.
///
/// @description Checks that it is a compile-time error to use `augmented` as a
/// constant value in a switch expressions and statements.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A02_t24.dart';

augment void set topLevelSetter(String value) {
  switch ("") {
    case augmented:
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    default:
  }
  var x = switch("") {
    augmented => 1,
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    _ => 0
  };
}

augment class C {
  augment static void set staticSetter(String value) {
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
  augment void set instanceSetter(String value) {
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

augment mixin M {
  augment static void set staticSetter(String value) {
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
  augment void set instanceSetter(String value) {
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

augment enum E {
  augment e1;

  augment static void set staticSetter(String value) {
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
  augment void set instanceSetter(String value) {
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

augment extension Ext {
  augment static void set staticSetter(String value) {
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
  augment void set instanceSetter(String value) {
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
