// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An initializer list begins with a colon, and consists of a
/// comma-separated list of individual initializers.
///
/// ⟨initializers⟩ ::= ‘:’ ⟨initializerListEntry⟩ (‘,’ ⟨initializerListEntry⟩)*
/// ⟨initializerListEntry⟩ ::= super ⟨arguments⟩
/// | super ‘.’ ⟨identifier⟩ ⟨arguments⟩
/// | ⟨fieldInitializer⟩
/// | ⟨assertion⟩
/// ⟨fieldInitializer⟩ ::=
/// (this ‘.’)? ⟨identifier⟩ ‘=’ ⟨initializerExpression⟩
/// ⟨initializerExpression⟩ ::=
/// ⟨assignableExpression⟩ ⟨assignmentOperator⟩ ⟨expression⟩
/// | ⟨conditionalExpression⟩
/// | ⟨cascade⟩
/// | ⟨throwExpression⟩
///
/// As a special disambiguation rule, an ⟨initializerExpression⟩ can not derive
/// a ⟨functionExpression⟩
///
/// @description Checks that it is a compile-time error if an external
/// constructor has any initializers
/// @author sgrekhov22@gmail.com

class A {}

class C extends A {
  int? x;
  external C() : super();
//             ^
// [analyzer] unspecified
// [cfe] unspecified

  external C.n() : x = 1;
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e1;
//^
// [cfe] unspecified

  final int? x;
  external const E() : x = 1;
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
}
