// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if the identifier `augmented` occurs
/// in a non-augmenting declaration, of a kind that can be augmenting, inside an
/// augmenting declaration.
///
/// @description Checks that it is a compile-time error to use a record with
/// a named parameter whose name is `augmented` in a location where the
/// outermost enclosing declaration is augmenting.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A10_t12.dart';

augment class C {
  static var staticVariable = () {
    print((augmented: 1));
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };

  static void staticMethod() {
    print((augmented: 1));
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  var instanceVariable = () {
    print((augmented: 1));
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };

  void instanceMethod() {
    print((augmented: 1));
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment mixin M {
  static var staticVariable = () {
    print((augmented: 1));
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };

  static void staticMethod() {
    print((augmented: 1));
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  var instanceVariable = () {
    print((augmented: 1));
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };

  void instanceMethod() {
    print((augmented: 1));
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment enum E {
  augment e1;
  static var staticVariable = () {
    print((augmented: 1));
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };

  static void staticMethod() {
    print((augmented: 1));
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  final instanceVariable = () {
    print((augmented: 1));
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };

  void instanceMethod() {
    print((augmented: 1));
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment extension Ext {
  static var staticVariable = () {
    print((augmented: 1));
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };

  static void staticMethod() {
    print((augmented: 1));
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  void instanceMethod() {
    print((augmented: 1));
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
