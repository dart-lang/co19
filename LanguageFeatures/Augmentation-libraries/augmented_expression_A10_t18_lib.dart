// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a non-augmenting member declaration Dm that occurs
/// inside an augmenting type declaration Dt. A compile-time error occurs if the
/// identifier `augmented` occurs in Dm.
///
/// @description Checks that it is a compile-time error to use a type whose name
/// is `augmented` in `is` and `as` expressions in a non-augmenting member
/// declaration inside an augmenting declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A10_t18.dart';

augment class C {
  static var staticVariable1 = null as augmented;
//                                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static var staticVariable2 = null is augmented;
//                                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void staticMethod() {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static int get staticGetter {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  static void set staticSetter(int _) {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  var instanceVariable1 = null as augmented;
//                                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var instanceVariable2 = null is augmented;
//                                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod() {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  int get instanceGetter {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  void set instanceSetter(int _) {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment mixin M {
  static var staticVariable1 = null as augmented;
//                                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static var staticVariable2 = null is augmented;
//                                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void staticMethod() {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static int get staticGetter {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  static void set staticSetter(int _) {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  var instanceVariable1 = null as augmented;
//                                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var instanceVariable2 = null is augmented;
//                                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod() {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  int get instanceGetter {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  void set instanceSetter(int _) {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment enum E {
  augment e1;
  static var staticVariable1 = null as augmented;
//                                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static var staticVariable2 = null is augmented;
//                                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void staticMethod() {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static int get staticGetter {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  static void set staticSetter(int _) {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  final instanceVariable1 = null as augmented;
//                                  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final instanceVariable2 = null is augmented;
//                                  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void instanceMethod() {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  int get instanceGetter {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  void set instanceSetter(int _) {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment extension Ext {
  static var staticVariable1 = null as augmented;
//                                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static var staticVariable2 = null is augmented;
//                                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static void staticMethod() {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static int get staticGetter {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  static void set staticSetter(int _) {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  void instanceMethod() {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  int get instanceGetter {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  void set instanceSetter(int _) {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
