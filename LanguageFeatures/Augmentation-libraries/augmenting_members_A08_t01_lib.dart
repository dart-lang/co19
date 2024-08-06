// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// A `const` variable is augmented by an augmenting getter.
///
/// @description Checks that that it is a compile-time error if a `const`
/// variable is augmented by an augmenting getter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_members_A08_t01.dart';

/**/augment String get topLevelConstant => "Augmented";
//  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C {
  augment static String get staticConstant => "Augmented";
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  augment static String get staticConstant => "Augmented";
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e1;
  augment static String get staticConstant => "Augmented";
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  augment static String get staticConstant => "Augmented";
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment static String get staticConstant => "Augmented";
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
