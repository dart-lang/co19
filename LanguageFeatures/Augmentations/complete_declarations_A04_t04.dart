// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion More precisely, a function or constructor declaration
/// (introductory or augmenting) is incomplete if all of:
/// - It has no body. That means no `{ ... }` or `=> ...;` but only `;`.
/// - The function is not marked external. An external function is considered to
///   have a body, just not one that is visible as Dart code.
/// - There is no redirection, initializer list, initializing formals, field
///   parameters, or super parameters. Obviously, this only applies to
///   constructor declarations.
///
/// If a declaration is not incomplete then it is complete.
///
/// It's a compile-time error if an augmentation is complete and any declaration
/// before it in the augmentation chain is also complete.
///
/// @description Checks that it is a compile-time error if an incomplete
/// implicit getter (abstract variable) is augmented by a setter with no getter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

abstract String topLevelVariable;
//              ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
augment void set topLevelVariable(String _) {}

class C {
  abstract String instanceVariable;
//                ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceVariable(String _) {}
}

mixin M {
  abstract String instanceVariable;
//                ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceVariable(String _) {}
}

enum E {
  e0;
  abstract String instanceVariable;
//                ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceVariable(String _) {}
}

class A {}

extension Ext on A {
  abstract String instanceVariable;
//                ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceVariable(String _) {}
}

extension type ET(int _) {
  abstract String instanceVariable;
//                ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceVariable(String _) {}
}

main() {
  print(topLevelVariable);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
