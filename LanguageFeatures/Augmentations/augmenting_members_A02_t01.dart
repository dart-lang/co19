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

part 'augmenting_members_A02_t01_lib.dart';

final String topLevelVariable = "topLevelVariable";

class C {
  static final String staticVariable = "staticVariable";
  final String instanceVariable = "instanceVariable";
}

mixin M {
  static final String staticVariable = "staticVariable";
  final String instanceVariable = "instanceVariable";
}

enum E {
  e0;
  static final String staticVariable = "staticVariable";
  final String instanceVariable = "instanceVariable";
}

class A {}

extension Ext on A {
  static final String staticVariable = "staticVariable";
}

extension type ET(String id) {
  static final String staticVariable = "staticVariable";
}

main() {
  print(topLevelVariable);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
