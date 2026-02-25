// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if an abstract variable augments a
/// getter and setter that don't have a combined signature.
///
/// @description Checks that it's a compile-time error if an abstract variable
/// augments a getter and setter that don't have a combined signature.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

abstract class A {
  int get instanceVariable;
}

abstract class C implements A {
  void set instanceVariable(String _);
}

augment abstract class C {
  augment abstract var instanceVariable;
//                     ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
}
