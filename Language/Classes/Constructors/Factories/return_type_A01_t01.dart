// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The return type of a factory whose signature is of the form
/// factory M or the form factory M.id is M if M is not a generic type;
/// otherwise the return type is M<T1, . . . , Tn> where T1, . . . , Tn are the
/// type parameters of the enclosing class.
///
/// @description Checks that result of invoking factory constructor of the form
/// `M` or `M.id` can be assigned to the variables whose types are assignable to
/// `M`
/// @author iefremov

class S {}

class A extends S {
  A.g() {}
  factory A() = D;
  factory A.bcd() = D;
}

class D extends A {
  D() : super.g();
}

enum E implements S {
  e1, e2;
  const E();
  factory E.n1() => E.e1;
}

main() {
  A a = new A();
  S s = new A();
  var d = new A();

  a = new A.bcd();
  s = new A.bcd();
  d = new A.bcd();

  s = E.n1();
  E e = E.n1();
}
