// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a non-augmenting member declaration Dm that occurs
/// inside an augmenting type declaration Dt. A compile-time error occurs if the
/// identifier `augmented` occurs in Dm.
///
/// @description Checks that it is a compile-time error to use an `augmented`
/// variable in a right hand expression in a non-augmenting member declaration
/// inside an augmenting declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmented_expression_A10_t09.dart';

augment class C {
  static var staticVariable = () {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };

  static void staticMethod() {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static int get staticGetter {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  static void set staticSetter(int _) {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  var instanceVariable = () {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };

  void instanceMethod() {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  int get instanceGetter {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  void set instanceSetter(int _) {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment mixin M {
  static var staticVariable = () {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };

  static void staticMethod() {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static int get staticGetter {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  static void set staticSetter(int _) {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  var instanceVariable = () {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };

  void instanceMethod() {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  int get instanceGetter {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  void set instanceSetter(int _) {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment enum E {
  augment e0;
  static var staticVariable = () {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };

  static void staticMethod() {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static int get staticGetter {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  static void set staticSetter(int _) {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  void instanceMethod() {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  int get instanceGetter {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  void set instanceSetter(int _) {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment extension Ext {
  static var staticVariable = () {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };

  static void staticMethod() {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static int get staticGetter {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  static void set staticSetter(int _) {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  void instanceMethod() {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  int get instanceGetter {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  void set instanceSetter(int _) {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment extension type ET {
  static var staticVariable = () {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };

  static void staticMethod() {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static int get staticGetter {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  static void set staticSetter(int _) {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  void instanceMethod() {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  int get instanceGetter {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  void set instanceSetter(int _) {
    int v = augmented;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    for (int i = augmented; i < 0; i++) {}
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
