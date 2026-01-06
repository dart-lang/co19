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
/// @description Checks that an incomplete getter may be made complete by an
/// external augmenting variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

String get topLevelGetter;
void set topLevelGetter(String _); // Avoid an error at the augmenting declaration
augment external String topLevelGetter;

class C {
  static String get staticGetter;
  static void set staticGetter(String _);
  String get instanceGetter;
  void set instanceGetter(String _);
}

augment class C {
  augment external static String staticGetter;
  augment external String instanceGetter;
}

mixin M {
  static String get staticGetter;
  static void set staticGetter(String _);
  String get instanceGetter;
  void set instanceGetter(String _);
}

augment mixin M {
  augment external static String staticGetter;
  augment external String instanceGetter;
}

enum E {
  e0;
  static String get staticGetter;
  static void set staticGetter(String _);
  String get instanceGetter;
  void set instanceGetter(String _);
}

augment enum E {
  ;
  augment external static String staticGetter;
  augment external String instanceGetter;
}

class A {}

extension Ext on A {
  static String get staticGetter;
  static void set staticGetter(String _);
  String get instanceGetter;
  void set instanceGetter(String _);
}

augment extension Ext {
  augment external static String staticGetter;
  augment external String instanceGetter;
}

extension type ET(int _) {
  static String get staticGetter;
  static void set staticGetter(String _);
  String get instanceGetter;
  void set instanceGetter(String _);
}

augment extension type ET {
  augment external static String staticGetter;
  augment external String instanceGetter;
}

main() {
  if (1 > 2) {
    topLevelGetter;
  }
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
