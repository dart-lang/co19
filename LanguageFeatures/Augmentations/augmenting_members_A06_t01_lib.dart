// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// A variable is augmented with another variable, and one is `late` and the
/// other is not.
///
/// @description Checks that it is a compile-time error if a variable is
/// augmented with another variable, and one is `late` and the other is not.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_members_A06_t01.dart';

/**/augment String topLevelVariable = "Augmented";
//  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C {
  augment static String staticVariable = "Augmented";
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String instanceVariable = "Augmented";
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  augment static String staticVariable = "Augmented";
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String instanceVariable = "Augmented";
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e0;
  augment static String staticVariable = "Augmented";
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  augment static String staticVariable = "Augmented";
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment static String staticVariable = "Augmented";
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
