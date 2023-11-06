// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The return type of a factory whose signature is of the form
/// factory M or the form factory M.id is M if M is not a generic type;
/// otherwise the return type is M<T1, . . . , Tn> where T1, . . . , Tn are the
/// type parameters of the enclosing class.
///
/// @description Checks that result of invoking factory constructor of the form
/// `M` or `M.id` can be assigned to the variables whose types are assignable to
/// `M`. Test type aliases
/// @author sgrekhov@unipro.ru

class S {}

class A extends S {
  A.g() {}
  factory A() => new AAlias.g();
  factory A.foo() => new DAlias();
}
typedef AAlias = A;

class D extends A {
  D(): super.g();
}
typedef DAlias = D;

enum E implements S {
  e1, e2;
  const E();
  factory E.n1() => EAlias.e1;
}
typedef EAlias = E;

main() {
  A a = new A();
  S s = new A();

  a = new A.foo();
  s = new A.foo();

  s = E.n1();
  E e = E.n1();
}
