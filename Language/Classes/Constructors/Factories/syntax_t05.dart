// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A factory is a constructor prefaced by the built-in identifier
/// factory.
/// ⟨factoryConstructorSignature⟩ ::=
///     const? factory ⟨constructorName⟩ ⟨formalParameterList⟩
///
/// @description Checks that it is a compile-time error if a non-redirecting
/// factory constructor is declared constant.
/// @author msyabro

class C {
  const factory C() => C();
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e1, e2;
  const E();
  const factory E.f() => E.e1;
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
}
