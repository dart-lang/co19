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
/// @description Checks that it is a compile-time error if any parameter of the
/// factory constructor has modifier `covariant`
/// @author sgrekhov22@gmail.com
/// @issue 54030

class F {
  factory F(covariant num x) = C;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  factory F.f1(num x, [covariant num y]) = C.f1;
//                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  factory F.f2(num x, {covariant num z}) = C.f2;
//                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  factory F.f3(num x, {required covariant num z}) = C.f3;
//                              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C implements F {
  num x, y = 1, z = 2;

  C(this.x);
  C.f1(this.x, [this.y = 1]);
  C.f2(this.x, {this.z = 2});
  C.f3(this.x, {required this.z});
}

enum E {
  e1, e2;
  const E();

  factory E.g1(num x) => E.e1;
  factory E.g2(num x, [num y = 1]) => E.e1;
  factory E.g3(num x, {num z = 2}) => E.e1;
  factory E.g4(num x, {num z = 2}) => E.e1;
  factory E.f1(covariant num x) = E.g1;
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  factory E.f2(num x, [covariant num y]) = E.g2;
//                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  factory E.f3(num x, {covariant num z}) = E.g3;
//                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  factory E.f4(num x, {required covariant num z}) = E.g3;
//                              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
}
