// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that it is a compile-time error if a redirecting factory
/// is external
/// @author sgrekhov22@gmail.com

class F {
  external factory F(num x) = C;
//                          ^
// [analyzer] unspecified
// [cfe] unspecified

  external factory F.f1(num x) = C.f1;
//                             ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C implements F {
  num x;

  external C(this.x);
  C.f1(this.x);
}

enum E {
  e1, e2;
  const E();

  factory E.g1(num x) => E.e1;
  external factory E.f0(num x);
  external factory E.f1(num x) = E.g1;
//                             ^
// [analyzer] unspecified
// [cfe] unspecified
  external factory E.f2(num x) = E.f0;
//                             ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
}
