// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// A non-final variable is augmented with a final variable.
///
/// @description Checks that it is a compile-time error if a non-final variable
/// is augmented with a final variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_members_A03_t01.dart';

/**/augment final String topLevelVariable = "Augmented";
//  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C {
  augment static final String staticVariable = "Augmented";
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment final String instanceVariable = "Augmented";
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  augment static final String staticVariable = "Augmented";
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment final String instanceVariable = "Augmented";
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e0;
  augment static final String staticVariable = "Augmented";
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  augment static final String staticVariable = "Augmented";
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment static final String staticVariable = "Augmented";
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
