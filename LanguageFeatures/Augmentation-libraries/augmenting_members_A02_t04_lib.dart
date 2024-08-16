// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// A non-writable variable declaration is augmented with a setter.
///
/// @description Checks that it is a compile-time error if a getter declaration
/// is augmented with a setter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_members_A02_t04.dart';

/**/augment void set topLevelGetter(String _) {}
//  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C {
  augment static void set staticGetter(String _) {}
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceGetter(String _) {}
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  augment static void set staticGetter(String _) {}
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceGetter(String _) {}
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e0;
  augment static void set staticGetter(String _) {}
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceGetter(String _) {}
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  augment static void set staticGetter(String _) {}
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceGetter(String _) {}
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment static void set staticGetter(String _) {}
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceGetter(String _) {}
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
