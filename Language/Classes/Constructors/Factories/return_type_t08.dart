/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The return type of a factory whose signature is of the
 * form factory M or the form factory M.id is M if M is not a generic type;
 * otherwise the return type is M <T1, …, Tn>, where T1, …, Tn are the type
 * parameters of the enclosing class.
 * @description Checks that result of invoking factory constructor of the form
 * M or M.id can be assigned to the variables whose types are assignable to M
 * and no static warnings are produced. Test type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
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

main() {
  A a = new A();
  S s = new A();
  D d = new D();

  a = new A.foo();
  s = new A.foo();
  d = new A.foo();
}
