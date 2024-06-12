// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A redirecting factory constructor specifies a call to a
/// constructor of another class that is to be used whenever the redirecting
/// constructor is called.
/// ⟨redirectingFactoryConstructorSignature⟩ ::=
///     const? factory ⟨constructorName⟩ ⟨formalParameterList⟩ ‘=’
///     ⟨constructorDesignation⟩
/// ⟨constructorDesignation⟩ ::= ⟨typeIdentifier⟩
///     | ⟨qualifiedName⟩
///     | ⟨typeName⟩ ⟨typeArguments⟩ (‘.’ ⟨identifier⟩)?
///
/// @description Checks that parameters list can not occur after another class
/// constructor name
/// @author ilya

class A {
  A() {}
  factory A.foo() = C();
//                  ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C extends A {}

enum E {
  e1, e2;
  const E();

  factory E.f1() => E.e1;
  factory E.f2() = E.f1();
//                   ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(A);
  print(E);
}
