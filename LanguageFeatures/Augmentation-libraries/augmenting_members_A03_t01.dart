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

import augment 'augmenting_members_A03_t01_lib.dart';

String topLevelVariable = "topLevelVariable";

class C {
  static String staticVariable = "staticVariable";
  String instanceVariable = "instanceVariable";
}

mixin M {
  static String staticVariable = "staticVariable";
  String instanceVariable = "instanceVariable";
}

enum E {
  e0;
  static String staticVariable = "staticVariable";
}

class A {}

extension Ext on A {
  static String staticVariable = "staticVariable";
}

extension type ET(String _) {
  static String staticVariable = "staticVariable";
}

main() {
  print(topLevelVariable);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
