// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if the identifier `augmented` occurs
/// in a non-augmenting declaration, of a kind that can be augmenting, inside an
/// augmenting declaration.
///
/// @description Checks that it is a compile-time error to declare a local
/// variable whose name is `augmented` in a location where the outermost
/// enclosing declaration is augmenting. Test a record pattern.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A10_t07.dart';

augment class C {
  static void staticMethod() {
    int (augmented,) = (42,);
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static int get staticGetter {
    int (augmented,) = (42,);
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  static void set staticSetter(int _) {
    int (augmented,) = (42,);
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  void instanceMethod() {
    int (augmented,) = (42,);
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  int get instanceGetter {
    int (augmented,) = (42,);
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  void set instanceSetter(int _) {
    int (augmented,) = (42,);
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment mixin M {
  static void staticMethod() {
    int (augmented,) = (42,);
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static int get staticGetter {
    int (augmented,) = (42,);
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  static void set staticSetter(int _) {
    int (augmented,) = (42,);
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  void instanceMethod() {
    int (augmented,) = (42,);
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  int get instanceGetter {
    int (augmented,) = (42,);
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  void set instanceSetter(int _) {
    int (augmented,) = (42,);
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment enum E {
  augment e0;
  static void staticMethod() {
    int (augmented,) = (42,);
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static int get staticGetter {
    int (augmented,) = (42,);
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  static void set staticSetter(int _) {
    int (augmented,) = (42,);
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  void instanceMethod() {
    int (augmented,) = (42,);
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  int get instanceGetter {
    int (augmented,) = (42,);
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  void set instanceSetter(int _) {
    int (augmented,) = (42,);
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment extension Ext {
  static void staticMethod() {
    int (augmented,) = (42,);
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static int get staticGetter {
    int (augmented,) = (42,);
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  static void set staticSetter(int _) {
    int (augmented,) = (42,);
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  void instanceMethod() {
    int (augmented,) = (42,);
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  int get instanceGetter {
    int (augmented,) = (42,);
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  void set instanceSetter(int _) {
    int (augmented,) = (42,);
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
