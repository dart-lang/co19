// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For purposes of augmentation, a variable declaration is treated
/// as implicitly defining a getter whose return type is the type of the
/// variable. If the variable is not final, or is late without an initializer,
/// then the variable declaration also implicitly defines a setter with a
/// parameter named `_` whose type is the type of the variable.
///
/// If the variable is abstract, then the getter and setter are incomplete,
/// otherwise they are complete. For non-abstract variables, the compiler
/// synthesizes a getter that accesses the backing storage and a setter that
/// updates it, so these members have bodies.
///
/// A getter can be augmented by another getter, and likewise a setter can be
/// augmented by a setter. This is true whether the getter or setter is
/// explicitly declared or implicitly declared using a variable declaration.
///
/// @description Checks that an incomplete variable may be made complete by
/// external augmenting getter and setter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

abstract String topLevelVariable;
augment external String get topLevelVariable;
augment external void set topLevelVariable(String _);

class C {
  static abstract String staticVariable;
  abstract String instanceVariable;
}

augment class C {
  augment external String get staticVariable;
  augment external void set staticVariable(String _);
  augment external String get instanceVariable;
  augment external void set instanceVariable(String _);
}

mixin M {
  static abstract String staticVariable;
  abstract String instanceVariable;
}

augment mixin M {
  augment external String get staticVariable;
  augment external void set staticVariable(String _);
  augment external String get instanceVariable;
  augment external void set instanceVariable(String _);
}

enum E {
  e0;
  static abstract String staticVariable;
  abstract String instanceVariable;
}

augment enum E {
  ;
  augment external String get staticVariable;
  augment external void set staticVariable(String _);
  augment external String get instanceVariable;
  augment external void set instanceVariable(String _);
}

class A {}

extension Ext on A {
  static abstract String staticVariable;
  abstract String instanceVariable;
}

augment extension Ext {
  augment external String get staticVariable;
  augment external void set staticVariable(String _);
  augment external String get instanceVariable;
  augment external void set instanceVariable(String _);
}

extension type ET(int _) {
  static abstract String staticVariable;
  abstract String instanceVariable;
}

augment extension type ET {
  augment external String get staticVariable;
  augment external void set staticVariable(String _);
  augment external String get instanceVariable;
  augment external void set instanceVariable(String _);
}

main() {
  if (1 > 2) {
    topLevelSetter = "";
  }
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
