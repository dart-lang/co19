// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// An augmenting declaration uses `augmented` when the augmented
/// declaration has no concrete implementation. Note that all external
/// declarations are assumed to have an implementation provided by another
/// external source, and otherwise they will throw a runtime error when called.
///
/// @description Checks that it is a compile-time error if an augmenting
/// declaration uses `augmented` when the augmented declaration has no concrete
/// implementation. Test static members.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_members_A01_t02.dart';

augment class C {
  augment static void abstractMethod() {
    augmented();
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  augment static String get abstractGetter => augmented;
//                                            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void set abstractSetter(String v) {
    augmented = v;
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment mixin M {
  augment static void abstractMethod() {
    augmented();
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  augment static String get abstractGetter => augmented;
//                                            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void set abstractSetter(String v) {
    augmented = v;
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment enum E {
  augment e0;
  augment static void abstractMethod() {
    augmented();
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  augment static String get abstractGetter => augmented;
//                                            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void set abstractSetter(String v) {
    augmented = v;
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment extension Ext {
  augment static void abstractMethod() {
    augmented();
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  augment static String get abstractGetter => augmented;
//                                            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void set abstractSetter(String v) {
    augmented = v;
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment extension type ET {
  augment static void abstractMethod() {
    augmented();
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  augment static String get abstractGetter => augmented;
//                                            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void set abstractSetter(String v) {
    augmented = v;
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
