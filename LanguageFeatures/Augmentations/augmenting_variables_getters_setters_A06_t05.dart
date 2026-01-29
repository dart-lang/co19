// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For purposes of augmentation, a variable declaration is treated
/// as implicitly defining a getter whose return type is the type of the
/// variable. If the variable is not final, or is late without an initializer,
/// then the variable declaration also implicitly defines a setter with a
/// parameter named `_` whose type is the type of the variable.
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
/// @description Checks that a complete variable may be augmented by an abstract
/// variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

int topLevelVariable = 0;
augment abstract int topLevelVariable;

// TODO (sgrekhov) This test does not include static abstract variable
// declarations because the grammar doesn't derive them. See
// https://github.com/dart-lang/language/issues/4592

class C {
  int instanceVariable = 0;
}

augment class C {
  augment abstract int instanceVariable;
}

mixin M {
  int instanceVariable = 0;
}

augment mixin M {
  augment abstract int instanceVariable;
}

enum E {
  e0;
  final int instanceVariable = 0;
}

augment enum E {
  ;
  augment abstract final int instanceVariable;
}

extension type ET(int instanceVariable) {}

augment extension type ET {
  augment abstract final int instanceVariable;
}

main() {
  print(topLevelVariable);
  print(C);
  print(M);
  print(E);
  print(ET);
}
