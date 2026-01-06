// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For purposes of augmentation, a variable declaration is treated
/// as implicitly defining a getter whose return type is the type of the
/// variable. If the variable is not `final`, or is `late` without an
/// initializer, then the variable declaration also implicitly defines a setter
/// with a parameter named `_` whose type is the type of the variable.
///
/// If the variable is `abstract`, then the getter and setter are incomplete,
/// otherwise they are complete. For non-abstract variables, the compiler
/// synthesizes a getter that accesses the backing storage and a setter that
/// updates it, so these members have bodies.
///
/// A getter can be augmented by another getter, and likewise a setter can be
/// augmented by a setter. This is true whether the getter or setter is
/// explicitly declared or implicitly declared using a variable declaration.
///
/// @description Checks that an `external` variable may be augmented by an
/// incomplete getter.
/// @author sgrekhov22@gmail.com
/// @issue 56536

// SharedOptions=--enable-experiment=augmentations

external int topLevelVariable;
augment int get topLevelVariable;

class C {
  external static int staticVariable;
  external int instanceVariable;
}

augment class C {
  augment static int get staticVariable;
  augment int get instanceVariable;
}

mixin M {
  external static int staticVariable;
  external int instanceVariable;
}

augment mixin M {
  augment static int get staticVariable;
  augment int get instanceVariable;
}

enum E {
  e0;
  external static int staticVariable;
  external int instanceVariable;
}

augment enum E {
  ;
  augment static int get staticVariable;
  augment int get instanceVariable;
}

class A {}

extension Ext on A {
  external static int staticVariable;
  external int instanceVariable;
}

augment extension Ext {
  augment static int get staticVariable;
  augment int get instanceVariable;
}

extension type ET(int _) {
  external static int staticVariable;
  external int instanceVariable;
}

augment extension type ET {
  augment static int get staticVariable;
  augment int get instanceVariable;
}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
