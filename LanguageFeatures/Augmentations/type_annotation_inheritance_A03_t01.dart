// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if an abstract variable augments a
/// getter and setter that don't have a combined signature.
///
/// @description Checks that it not an error if an augmentation omits the bounds
/// type parameters of a class-like declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

// TODO (sgrekhov) This test does not include static abstract variable
// declarations because the grammar doesn't derive them. See
// https://github.com/dart-lang/language/issues/4592

int get topLevel => 42;

void set topLevel(String v) {}

augment abstract var topLevel;
//                   ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  int get instanceVariable => 42;
  void set instanceVariable(String v) {}
}

augment class C {
  augment abstract var instanceVariable;
//                            ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  int get instanceVariable => 42;
  void set instanceVariable(String v) {}
}

augment mixin M {
  augment abstract var instanceVariable;
//                            ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(topLevel);
  print(C);
  print(M);
}
