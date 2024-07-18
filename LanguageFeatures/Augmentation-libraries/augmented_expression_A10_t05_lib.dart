// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a non-augmenting member declaration Dm that occurs
/// inside an augmenting type declaration Dt. A compile-time error occurs if the
/// identifier `augmented` occurs in Dm.
///
/// @description Checks that it is a compile-time error to declare a local
/// variable whose name is `augmented` in a non-augmenting member declaration
/// inside an augmenting declaration. Test a list pattern.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A10_t05.dart';

augment class C {
  static var staticVariable = () {
    var [augmented] = [42];
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };

  static void staticMethod() {
    var [augmented] = [42];
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static int get staticGetter {
    var [augmented] = [42];
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  static void set staticSetter(int _) {
    var [augmented] = [42];
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  var instanceVariable = () {
    var [augmented] = [42];
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };

  void instanceMethod() {
    var [augmented] = [42];
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  int get instanceGetter {
    var [augmented] = [42];
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  void set instanceSetter(int _) {
    var [augmented] = [42];
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment mixin M {
  static var staticVariable = () {
    var [augmented] = [42];
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };

  static void staticMethod() {
    var [augmented] = [42];
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static int get staticGetter {
    var [augmented] = [42];
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  static void set staticSetter(int _) {
    var [augmented] = [42];
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  var instanceVariable = () {
    var [augmented] = [42];
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };

  void instanceMethod() {
    var [augmented] = [42];
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  int get instanceGetter {
    var [augmented] = [42];
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  void set instanceSetter(int _) {
    var [augmented] = [42];
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment enum E {
  augment e0;
  static var staticVariable = () {
    var [augmented] = [42];
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };

  static void staticMethod() {
    var [augmented] = [42];
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static int get staticGetter {
    var [augmented] = [42];
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  static void set staticSetter(int _) {
    var [augmented] = [42];
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  void instanceMethod() {
    var [augmented] = [42];
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  int get instanceGetter {
    var [augmented] = [42];
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  void set instanceSetter(int _) {
    var [augmented] = [42];
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment extension Ext {
  static var staticVariable = () {
    var [augmented] = [42];
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };

  static void staticMethod() {
    var [augmented] = [42];
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static int get staticGetter {
    var [augmented] = [42];
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  static void set staticSetter(int _) {
    var [augmented] = [42];
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  void instanceMethod() {
    var [augmented] = [42];
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  int get instanceGetter {
    var [augmented] = [42];
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  void set instanceSetter(int _) {
    var [augmented] = [42];
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
