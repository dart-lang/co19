// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting setters: Within an augmenting setter `augmented` must be
///   followed by an `=` and will directly invoke the augmented setter. If
///   augmenting a variable with a setter, this will invoke the implicitly
///   induced setter from the augmented variable declaration.
///
/// @description Checks that it is a compile-time error to declare local
/// function named `augmented()` within an augmenting setter
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmented_expression_A02_t10.dart';

augment void set topLevelSetter(String value) {
  String augmented() => "x";
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var f = () {
    String augmented() => "y";
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}

augment class C {
  augment static void set staticSetter(String value) {
    String augmented() => "x";
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    var f = () {
      String augmented() => "y";
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }
  augment void set instanceSetter(String value) {
    String augmented() => "x";
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    var f = () {
      String augmented() => "y";
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }
}

augment mixin M {
  augment static void set staticSetter(String value) {
    String augmented() => "x";
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    var f = () {
      String augmented() => "y";
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }
  augment void set instanceSetter(String value) {
    String augmented() => "x";
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    var f = () {
      String augmented() => "y";
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }
}

augment enum E {
  augment e1;

  augment static void set staticSetter(String value) {
    String augmented() => "x";
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    var f = () {
      String augmented() => "y";
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }
  augment void set instanceSetter(String value) {
    String augmented() => "x";
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    var f = () {
      String augmented() => "y";
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }
}

augment extension Ext {
  augment static void set staticSetter(String value) {
    String augmented() => "x";
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    var f = () {
      String augmented() => "y";
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }
  augment void set instanceSetter(String value) {
    String augmented() => "x";
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    var f = () {
      String augmented() => "y";
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }
}

augment extension type ET {
  augment static void set staticSetter(String value) {
    String augmented() => "x";
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    var f = () {
      String augmented() => "y";
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }
  augment void set instanceSetter(String value) {
    String augmented() => "x";
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    var f = () {
      String augmented() => "y";
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }
}
