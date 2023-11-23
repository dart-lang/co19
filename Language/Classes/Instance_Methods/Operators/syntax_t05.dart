// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// ⟨operatorSignature⟩ ::=
/// ⟨type⟩? operator ⟨operator⟩ ⟨formalParameterList⟩
/// ⟨operator⟩ ::= ‘~’
/// | ⟨binaryOperator⟩
/// | ‘[]’
/// | ‘[]=’
/// ⟨binaryOperator⟩ ::= ⟨multiplicativeOperator⟩
/// | ⟨additiveOperator⟩
/// | ⟨shiftOperator⟩
/// | ⟨relationalOperator⟩
/// | ‘==’
/// | ⟨bitwiseOperator⟩
///
/// @description Checks that it is a compile-time error to declare a static
/// user-defined operator
/// @author sgrekhov22@gmail.com

class C {
  static int operator +(int other) => 42;
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static int operator +(int other) => 42;
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e1, e2;

  static int operator +(int other) => 42;
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
  print(E);
}
