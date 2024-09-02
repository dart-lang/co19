// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A final variable can be augmented with a non-final augmenting
/// variable, and that will not add any setter. An augmenting variable
/// declaration only affects the initializer expression, not setters.
///
/// @description Checks that if a final `late` variable is augmented with a
/// non-final `late` augmenting variable then it is still a compile-time error
/// to write to it.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_members_A04_t05_lib.dart';

late final String topLevelVariable = "topLevelVariable";

class C {
  static late final String staticVariable = "staticVariable";
  late final String instanceVariable = "instanceVariable";
}

mixin M {
  static late final String staticVariable = "staticVariable";
  late final String instanceVariable = "instanceVariable";
}

enum E {
  e0;
  static late final String staticVariable = "staticVariable";
}

class A {}

extension Ext on A {
  static late final String staticVariable = "staticVariable";
}

extension type ET(String _) {
  static late final String staticVariable = "staticVariable";
}

class MA = Object with M;

main() {
  topLevelVariable = "";
//^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C.staticVariable = "";
//  ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C().instanceVariable = "";
//    ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  M.staticVariable = "";
//  ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  MA().instanceVariable = "";
//     ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  E.staticVariable = "";
//  ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Ext.staticVariable = "";
//  ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  ET.staticVariable = "";
//  ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
