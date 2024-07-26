// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Synthetic getters cannot be augmented with metadata or doc
/// comments.
///
/// @description Checks that it is a compile-time error to augment a variable by
/// an augmenting getter with an empty body.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_getters_A03_t01.dart';

augment String get topLevelVariable;
//                 ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C {
  augment static String get staticVariable;
//                          ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String get instanceVariable;
//                   ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  augment static String get staticVariable;
//                          ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String get instanceVariable;
//                   ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e0;
  augment static String get staticVariable;
//                          ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String get instanceVariable;
//                   ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  augment static String get staticVariable;
//                          ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET(String instanceVariable) {
  augment static String get staticVariable;
//                          ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String get instanceVariable;
//                   ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
