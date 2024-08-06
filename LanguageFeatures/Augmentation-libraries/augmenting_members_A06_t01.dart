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

import augment 'augmenting_members_A06_t01_lib.dart';

late String topLevelVariable = "topLevelVariable";

class C {
  static late String staticVariable = "staticVariable";
  late String instanceVariable = "instanceVariable";
}

mixin M {
  static late String staticVariable = "staticVariable";
  late String instanceVariable = "instanceVariable";
}

enum E {
  e0;
  static late String staticVariable = "staticVariable";
}

class A {}

extension Ext on A {
  static late String staticVariable = "staticVariable";
}

extension type ET(String _) {
  static late String staticVariable = "staticVariable";
}

main() {
  print(topLevelVariable);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
