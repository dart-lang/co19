// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Case ⟨Static or library variable⟩. If `d` declares a static or
/// library variable, the implicitly induced getter of `id` executes as follows:
/// ...
/// - Constant variable. If `d` declares a constant variable with the
///   initializing expression `e`, the result of executing the implicitly
///   induced getter is the value of the constant expression `e`.
///
/// @description Checks that it is a compile-time error if initializing
/// expression invokes `id`. Test the case when the type of the constant is not
/// specified.
/// @author sgrekhov22@gmail.com
/// @issue 59945

const one = 2 > 1 ? one : null;
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
const two = 2 > 1 ? null : two; // Ok

class C {
  static const one = 2 > 1 ? one : null;
//             ^^^
// [analyzer] unspecified
// [cfe] unspecified
  static const two = 2 > 1 ? null : two; // Ok
}

mixin M {
  static const one = 2 > 1 ? one : null;
//             ^^^
// [analyzer] unspecified
// [cfe] unspecified
  static const two = 2 > 1 ? null : two;
}

enum E {
  e0;
  static const one = 2 > 1 ? one : null;
//             ^^^
// [analyzer] unspecified
// [cfe] unspecified
  static const two = 2 > 1 ? null : two;
}

class A {}

extension Ext on A {
  static const one = 2 > 1 ? one : null;
//             ^^^
// [analyzer] unspecified
// [cfe] unspecified
  static const two = 2 > 1 ? null : two;
}

extension type ET(int _) {
  static const one = 2 > 1 ? one : null;
//             ^^^
// [analyzer] unspecified
// [cfe] unspecified
  static const two = 2 > 1 ? null : two;
}

main() {
  print(one);
  print(two);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
