// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// - Augmenting getters: Within an augmenting getter `augmented` invokes the
///   getter and evaluates to the return value. If augmenting a field with a
///   getter, this will invoke the implicit getter from the augmented field.
///
/// @description Checks that it is a compile-time error if within an augmenting
/// getter `augmented =` expression is invoked.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A01_t04.dart';

augment String get topLevelVariable {
  augmented = "x";
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var f = () {
    augmented = "x";
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
  return "Augmented";
}

augment class C {
  augment static String get staticField {
    augmented = "x";
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    var f = () {
      augmented = "x";
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    return "Augmented";
  }
  augment String get instanceField {
    augmented = "x";
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    var f = () {
      augmented = "x";
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    return "Augmented";
  }
}

augment mixin M {
  augment static String get staticField {
    augmented = "x";
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    var f = () {
      augmented = "x";
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    return "Augmented";
  }
  augment String get instanceField {
    augmented = "x";
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    var f = () {
      augmented = "x";
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    return "Augmented";
  }
}

augment enum E {
  augment e1;

  augment static String get staticField {
    augmented = "x";
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    var f = () {
      augmented = "x";
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    return "Augmented";
  }
  augment String get instanceField {
    augmented = "x";
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    var f = () {
      augmented = "x";
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    return "Augmented";
  }
}

augment extension Ext {
  augment static String get staticField {
    augmented = "x";
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    var f = () {
      augmented = "x";
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    return "Augmented";
  }
}
