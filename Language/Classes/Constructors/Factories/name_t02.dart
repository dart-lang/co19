// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A factory is a constructor prefaced by the built-in identifier
/// factory.
///
/// ⟨factoryConstructorSignature⟩ ::=
/// const? factory ⟨constructorName⟩ ⟨formalParameterList⟩
/// The return type of a factory whose signature is of the form factory M or the
/// form factory M.id is M if M is not a generic type; otherwise the return type
/// is M<T1, . . . , Tn> where T1, . . . , Tn are the type parameters of the
/// enclosing class.
/// It is a compile-time error if M is not the name of the immediately enclosing
/// class or enum.
///
/// @description Checks that it's a compile-time error when the `factory`
/// keyword is followed by a name that is not a constructor name.
/// @author rodionov

class C {
  factory WrongClass.id() => throw "Should not reach here";
//        ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e1, e2;

  const E();

  factory WrongClass.id() => E.e1;
//        ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}


main() {
  print(C);
  print(E);
}
