// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// A non-writable variable declaration is augmented with a setter.
///
/// @description Checks that it is a compile-time error if an implicitly induced
/// getter of a final variable declaration is augmented with a setter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_members_A02_t01.dart';

/**/augment void set topLevelVariable(String _) {}
//  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C {
  augment static void set staticVariable(String _) {}
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceVariable(String _) {}
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  augment static void set staticVariable(String _) {}
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceVariable(String _) {}
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e0;
  augment static void set staticVariable(String _) {}
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceVariable(String _) {}
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  augment static void set staticVariable(String _) {}
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment static void set staticVariable(String _) {}
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void set id(String _) {}
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
