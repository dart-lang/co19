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

part 'augmenting_getters_setters_with_variable_A01_t03_lib.dart';

void set topLevelSetter(String v) {}

class C {
  static void set staticSetter(String v) {}
  void set instanceSetter(String v) {}
}

mixin M {
  static void set staticSetter(String v) {}
  void set instanceSetter(String v) {}
}

enum E {
  e0;
  static void set staticSetter(String v) {}
}

class A {}

extension Ext on A {
  static void set staticSetter(String v) {}
}

extension type ET(int _) {
  static void set staticSetter(String v) {}
}

main() {
  topLevelSetter = 0;
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
