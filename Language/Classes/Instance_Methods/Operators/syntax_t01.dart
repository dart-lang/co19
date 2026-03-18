// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that any return type (including function type, type 
/// parameter, void or no return type at all) can be specified for any operator.
/// @author iefremov

typedef int Foo(double d);

class C<T> {
  int operator +(v) => 42;
  List operator [](v) => [];
  operator -() {}
  operator -(v) {}
  operator []=(v, v2) {}
  dynamic operator ~() {}
  Foo operator *(v) => (double s) => 42;
  T operator >(T t) => t;
}

main() {
  C c = new C();
  dynamic x = c + c;
  x = c - c;
  x = c[c];
  c[c] = c;
  -c;
  x = ~c;
  x = c == c;
}
