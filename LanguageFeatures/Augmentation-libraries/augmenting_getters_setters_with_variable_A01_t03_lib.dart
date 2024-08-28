// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Augmenting a getter and/or setter with a variable: This is a
/// compile-time error in all cases. Augmenting an abstract or external variable
/// with a variable is also a compile-time error, as those are actually just
/// syntax sugar for a getter and possibly a setter.
///
/// @description Checks that it is a compile-time error to augment a setter with
/// a variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_getters_setters_with_variable_A01_t03.dart';

augment String topLevelSetter = "Augmented";
//             ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C {
  augment static String staticSetter = "Augmented";
//                      ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String instanceSetter = "Augmented";
//               ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  augment static String staticSetter = "Augmented";
//                      ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment String instanceSetter = "Augmented";
//               ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e0;
  augment static String staticSetter = "Augmented";
//                      ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  augment static String staticSetter = "Augmented";
//                      ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment static String staticSetter = "Augmented";
//                      ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
