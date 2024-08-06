// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// An `abstract` variable is augmented with a non-abstract variable, getter, or
/// setter.
///
/// @description Checks that that it is a compile-time error if an `abstract`
/// variable is augmented with a non-abstract variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_members_A09_t01.dart';

augment abstract class C1 {
  augment String abstractVariable = "Augmented";
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment abstract class C2 {
  augment String get abstractVariable => "Augmented";
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment abstract class C3 {
  augment void set abstractVariable(String _) {}
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
