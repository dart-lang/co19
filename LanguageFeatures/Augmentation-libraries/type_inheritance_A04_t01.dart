// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration may have no type annotations for a
/// return type, variable type, parameter type, or type parameter bound type. In
/// the last case, that includes omitting the extends keyword. For a variable or
/// parameter, a var keyword may replace the type.
///
/// When applying an augmenting declaration that contains a type annotation at
/// one of these positions, to a definition to be augmented, it's a compile-time
/// error if the type denoted by the augmenting declaration is not the same type
/// as the type that the augmented definition has at the corresponding position.
/// An augmenting declaration can omit type annotations, but if it doesn't, it
/// must repeat the type from the augmented definition.
///
/// @description Check that it is a compile-time error if augmenting declaration
/// specifies a formal parameter type other than the augmented declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'type_inheritance_A04_t01_lib.dart';

void topLevelFunction(num v) {}
void set topLevelSetter(num v) {}

class C {
  static void staticMethod(num v) {}
  static void set staticSetter(num v) {}
  void instanceMethod(num v) {}
  void set instanceSetter(num v) {}
}

mixin M {
  static void staticMethod(num v) {}
  static void set staticSetter(num v) {}
  void instanceMethod(num v) {}
  void set instanceSetter(num v) {}
}

enum E {
  e0;
  static void staticMethod(num v) {}
  static void set staticSetter(num v) {}
  void instanceMethod(num v) {}
  void set instanceSetter(num v) {}
}

class A {}

extension Ext on A {
  static void staticMethod(num v) {}
  static void set staticSetter(num v) {}
  void instanceMethod(num v) {}
  void set instanceSetter(num v) {}
}

extension type ET(int id) {
  static void staticMethod(num v) {}
  static void set staticSetter(num v) {}
  void instanceMethod(num v) {}
  void set instanceSetter(num v) {}
}

main() {
  topLevelSetter = 0;
  print(topLevelFunction);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
