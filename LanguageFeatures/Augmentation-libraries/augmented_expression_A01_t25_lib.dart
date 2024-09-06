// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// - Augmenting getters: Within an augmenting getter `augmented` invokes the
///   augmented getter and evaluates to its return value. If augmenting a
///   variable with a getter, this will invoke the implicitly induced getter
///   from the augmented variable declaration.
///
/// @description Checks that it is a compile-time error to use `augmented` as a
/// constant value in a switch expressions and statements.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmented_expression_A01_t25.dart';

augment String get topLevelGetter {
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
  return "";
}

augment class C {
  augment static String get staticGetter {
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
    return "";
  }
  augment String get instanceGetter {
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
    return "";
  }
}

augment mixin M {
  augment static String get staticGetter {
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
    return "";
  }
  augment String get instanceGetter {
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
    return "";
  }
}

augment enum E {
  augment e1;

  augment static String get staticGetter {
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
    return "";
  }
  augment String get instanceGetter {
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
    return "";
  }
}

augment extension Ext {
  augment static String get staticGetter {
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
    return "";
  }
  augment String get instanceGetter {
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
    return "";
  }
}
