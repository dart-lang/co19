// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The return type of a factory whose signature is of the form
/// factory M or the form factory M.id is M if M is not a generic type;
/// otherwise the return type is M<T1, . . . , Tn> where T1, . . . , Tn are the
/// type parameters of the enclosing class.
///
/// @description Checks that returning an object whose type is not subtype of
/// `M` from factory `M.id` produces a compile error.
/// @author kaigorodov

abstract class I {}

class C implements I {}

class A implements I {
  factory A.foo() => C();
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e1, e2;
  const E();
  factory E.f() => C();
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(A);
  print(E);
}
