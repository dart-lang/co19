// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if:
/// ...
/// A getter or setter (including one implicitly induced by a variable
/// declaration) is not complete after all augmentations are applied, unless
/// it's an instance member and the surrounding class is abstract.
///
/// @description Checks that it is a compile-time error if an implicit setter is
/// not complete after all augmentations are applied.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

abstract int topLevelVariable;
//           ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
augment abstract int topLevelVariable;
augment int get topLevelVariable => 0;

// TODO (sgrekhov) This test does not include static abstract variable
// declarations because the grammar doesn't derive them. See
// https://github.com/dart-lang/language/issues/4592

class C {
  abstract int instanceVariable;
//             ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment abstract int instanceVariable;
  augment int get instanceVariable => 0;
}

mixin M {
  abstract int instanceVariable;
//             ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment abstract int instanceVariable;
  augment int get instanceVariable => 0;
}

enum E {
  e0;
  abstract int instanceVariable;
//             ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment abstract int instanceVariable;
  augment int get instanceVariable => 0;
}

class A {}

extension Ext on A {
  abstract int instanceVariable;
//             ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment abstract int instanceVariable;
  augment int get instanceVariable => 0;
}

extension type ET(int _) {
  abstract int instanceVariable;
//             ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment abstract int instanceVariable;
  augment int get instanceVariable => 0;
}

main() {
  print(topLevelVariable);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
