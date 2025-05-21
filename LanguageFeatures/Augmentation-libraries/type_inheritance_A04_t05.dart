// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the type annotation or type parameter bound is omitted in the
/// augmenting declaration, it is inferred to be the same as the corresponding
/// type annotation or type parameter bound in the declaration being augmented.
///
/// If the type annotation or type parameter bound is not omitted, then it's a
/// compile-time error if the type denoted by the augmenting declaration is not
/// the same type as the type in the corresponding declaration being augmented.
///
/// @description Check that it is a compile-time error if an augmenting
/// declaration specifies a formal parameter type other than the introductory
/// declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part 'type_inheritance_A04_t05_lib.dart';

void topLevelFunction(v) {}

void set topLevelSetter(var v);

class C {
  static void staticMethod(v);
  static void set staticSetter(var v) {}
  void instanceMethod(final v) {}
  void set instanceSetter(v);
}

mixin M {
  static void staticMethod(v);
  static void set staticSetter(var v) {}
  void instanceMethod(final v) {}
  void set instanceSetter(v);
}

enum E {
  e0;
  static void staticMethod(v);
  static void set staticSetter(var v) {}
  void instanceMethod(final v) {}
  void set instanceSetter(v);
}

class A {}

extension Ext on A {
  static void staticMethod(v);
  static void set staticSetter(var v) {}
  void instanceMethod(final v) {}
  void set instanceSetter(v);
}

extension type ET(int id) {
  static void staticMethod(v);
  static void set staticSetter(var v) {}
  void instanceMethod(final v) {}
  void set instanceSetter(v);
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
