// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A factory is a constructor prefaced by the built-in identifier
/// factory.
/// ⟨factoryConstructorSignature⟩ ::=
///     const? factory ⟨constructorName⟩ ⟨formalParameterList⟩
///
/// @description Checks that it is a compile-time error if a non-redirecting
/// factory constructor has an initializers list
/// @author msyabro

class A {
  int x;
  A(this.x);
  factory A.f() : x = 1 {
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    return C();
  }
}

class C extends A {
  C() : super(0);
}

enum E {
  e1(1), e2(2);

  final x;

  const E(this.x);
//             ^
// [analyzer] unspecified

  factory E.f() : x = 0 {
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    return E.e1;
  }
}

main() {
  print(C);
  print(E);
}
