// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The return type of a factory whose signature is of the form
/// factory M or the form factory M.id is M if M is not a generic type;
/// otherwise the return type is M<T1, . . . , Tn> where T1, . . . , Tn are the
/// type parameters of the enclosing class.
///
/// @description Checks that returning `null` from factory constructor `M`
/// produces an error.
/// @author ilya

class A {
  factory A() => null;
//               ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  factory A.foo() => null;
//                   ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1 {
  e1.g(), e2.g();
  const E1.g();
  factory E1() => null;
//               ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 {
  e1, e2;
  const E2();
  factory E2.f() => null;
//                  ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(A);
  print(E1);
  print(E2);
}
