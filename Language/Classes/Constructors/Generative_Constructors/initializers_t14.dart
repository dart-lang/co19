// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that it is a compile-time error when identifier in an
/// initializer references an instance method rather than a variable.
/// @author rodionov

typedef void Foo();

class C {
  C() : bar = null {}
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified

  void bar() {}
}

main() {
  new C();
}
