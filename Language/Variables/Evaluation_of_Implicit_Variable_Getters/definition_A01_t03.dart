// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Case ⟨Static or library variable⟩. If `d` declares a static or
/// library variable, the implicitly induced getter of `id` executes as follows:
/// - Non-constant variable with an initializer. In the case where `d` has an
///   initializing expression and is not constant, the implicitly induced getter
///   of `id` is a late-initialized getter. This determines the semantics of an
///   invocation.
///
/// @description Checks that it is a compile-time error if during an evaluation
/// of the initializing expression `id` is invoked and the type of the variable
/// is not specified.
/// @author sgrekhov@unipro.ru
/// @issue 46086

f(func) {}

var sVar = f(() => sVar);
//  ^^^^
// [analyzer] unspecified
// [cfe] unspecified

final sFinal = f(() => sFinal);
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static var sVar = f(() => sVar);
//           ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static final sFinal = f(() => sFinal);
//             ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static var sVar = f(() => sVar);
//           ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static final sFinal = f(() => sFinal);
//             ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  static var sVar = f(() => sVar);
//           ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static final sFinal = f(() => sFinal);
//             ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static var sVar = f(() => sVar);
//           ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static final sFinal = f(() => sFinal);
//             ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  static var sVar = f(() => sVar);
//           ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static final sFinal = f(() => sFinal);
//             ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(sVar);
  print(sFinal);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
