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
