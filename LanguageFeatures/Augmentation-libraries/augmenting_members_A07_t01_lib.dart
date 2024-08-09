// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// A late final variable with no initializer expression is augmented by an
/// augmenting variable with an initializer expression.
///
/// @description Checks that that it is a compile-time error if a late final
/// variable with no initializer expression is augmented by an augmenting
/// variable with an initializer expression.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_members_A07_t01.dart';

augment late final String? finalTopLevelVariable = "Augmented";
//                                                 ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C {
  augment static late final String? finalStaticVariable = "Augmented";
//                                                        ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment late final String? finalInstanceVariable = "Augmented";
//                                                   ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  augment static late final String? finalStaticVariable = "Augmented";
//                                                        ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment late final String? finalInstanceVariable = "Augmented";
//                                                   ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e1;
  augment static late final String? finalStaticVariable = "Augmented";
//                                                        ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  augment static late final String? finalStaticVariable = "Augmented";
//                                                        ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment static late final String? finalStaticVariable = "Augmented";
//                                                        ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
