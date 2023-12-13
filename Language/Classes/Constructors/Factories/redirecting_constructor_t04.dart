// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that correct declarations of redirecting factory
/// constructors do not cause errors. Test type aliases
/// @author sgrekhov@unipro.ru
/// @issue 45051

import "../../../../Utils/expect.dart";

class A {
  A() {}
  factory A.foo() = CAlias.bar;
  int m() => 42;
}
typedef AAlias = A;

class C extends A {
  C() {}
  factory C.bar() = DAlias;
  int m() { return 1; }
}
typedef CAlias = C;

class D extends CAlias {
  int m() { return 2; }
}
typedef DAlias = D;

enum E {
  e1, e2;
  const E();

  factory E.f1() => E.e1;
  factory E.f2() = EAlias.f1;
}
typedef EAlias = E;

main() {
  A a = new A.foo();
  Expect.equals(2, a.m());
  Expect.identical(E.e1, E.f2());
}
