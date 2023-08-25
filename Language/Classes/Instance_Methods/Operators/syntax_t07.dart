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
/// @description Checks that it is not an error to declare an abstract
/// user-defined operator
/// @author sgrekhov22@gmail.com

import '../../../../Utils/expect.dart';

abstract class A {
  int operator +(int other);
}

mixin M {
  int operator *(int other);
}

class C extends A with M {
  int operator +(int other) => 1;
  int operator *(int other) => 2;
}

main() {
  Expect.equals(1, C() + 42);
  Expect.equals(2, C() * 42);
}
