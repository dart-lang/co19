// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if:
/// ...
/// A getter or setter (including one implicitly induced by a variable
/// declaration) is not complete after all augmentations are applied, unless
/// it's an instance member and the surrounding class is abstract.
///
/// @description Checks that it is a compile-time error if an implicit getter is
/// not complete after all augmentations are applied.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

abstract final int topLevelVariable;
//                 ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
augment abstract final int topLevelVariable;

// TODO (sgrekhov) This test does not include static abstract variable
// declarations because the grammar doesn't derive them. See
// https://github.com/dart-lang/language/issues/4592

class C {
  abstract final int instanceVariable;
//                   ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment abstract final int instanceVariable;
}

mixin M {
  abstract final int instanceVariable;
//                   ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment abstract final int instanceVariable;
}

enum E {
  e0;
  abstract final int instanceVariable;
//                   ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment abstract final int instanceVariable;
}

class A {}

extension Ext on A {
  abstract final int instanceVariable;
//                   ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment abstract final int instanceVariable;
}

extension type ET(int _) {
  abstract final int instanceVariable;
//                   ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment abstract final int instanceVariable;
}

main() {
  print(topLevelVariable);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
