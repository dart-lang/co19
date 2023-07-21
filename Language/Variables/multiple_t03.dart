// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An ⟨initializedVariableDeclaration⟩ that declares two or more
/// variables is equivalent to multiple variable declarations declaring the same
/// set of variable names, in the same order, with the same initialization,
/// type, and modifiers
///
/// @description Checks that it is a compile-time error to use an instance
/// variable in an initializing expression of the another instance variable
/// @author sgrekhov22@gmail.com

class C {
  var v1 = 1, v2 = v1;
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified

  final int v3 = 3, v4 = v3;
//                       ^^
// [analyzer] unspecified
// [cfe] unspecified

  late final int v5 = 5, v6 = v5, v7 = v3; // No error for the late variables

  int v8 = v5;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
}
