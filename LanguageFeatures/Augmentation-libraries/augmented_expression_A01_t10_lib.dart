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
/// @description Checks that it is a compile-time error to declare a local
/// variable named `augmented` within an augmenting getter
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmented_expression_A01_t10.dart';

augment String get topLevelGetter {
  var augmented = "x";
//    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var f = () {
    String augmented = "y";
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
  return "Augmented";
}

augment class C {
  augment static String get staticGetter {
    var augmented = "x";
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    var f = () {
      String augmented = "y";
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    return "Augmented";
  }
  augment String get instanceGetter {
    var augmented = "x";
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    var f = () {
      String augmented = "y";
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    return "Augmented";
  }
}

augment mixin M {
  augment static String get staticGetter {
    var augmented = "x";
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    var f = () {
      String augmented = "y";
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    return "Augmented";
  }
  augment String get instanceGetter {
    var augmented = "x";
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    var f = () {
      String augmented = "y";
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    return "Augmented";
  }
}

augment enum E {
  augment e1;

  augment static String get staticGetter {
    var augmented = "x";
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    var f = () {
      String augmented = "y";
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    return "Augmented";
  }
  augment String get instanceGetter {
    var augmented = "x";
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    var f = () {
      String augmented = "y";
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    return "Augmented";
  }
}

augment extension Ext {
  augment static String get staticGetter {
    var augmented = "x";
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    var f = () {
      String augmented = "y";
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    return "Augmented";
  }
  augment String get instanceGetter {
    var augmented = "x";
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    var f = () {
      String augmented = "y";
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    return "Augmented";
  }
}

augment extension type ET {
  augment static String get staticGetter {
    var augmented = "x";
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    var f = () {
      String augmented = "y";
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    return "Augmented";
  }
  augment String get instanceGetter {
    var augmented = "x";
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    var f = () {
      String augmented = "y";
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
    return "Augmented";
  }
}
