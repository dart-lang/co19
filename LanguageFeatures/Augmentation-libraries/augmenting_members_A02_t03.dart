// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// A non-writable variable declaration is augmented with a setter.
///
/// @description Checks that it is a compile-time error if a non-writable
/// variable declaration is augmented with a setter. Test `const` variables.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_members_A02_t03_lib.dart';

const topLevelVariable = "topLevelVariable";

class C {
  static const staticVariable = "staticVariable";
}

mixin M {
  static const staticVariable = "staticVariable";
}

enum E {
  e0;
  static const staticVariable = "staticVariable";
}

class A {}

extension Ext on A {
  static const staticVariable = "staticVariable";
}

extension type ET(String _) {
  static const staticVariable = "staticVariable";
}

main() {
  print(topLevelVariable);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
