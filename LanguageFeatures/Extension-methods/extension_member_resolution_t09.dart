/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion For any member access, x.foo, x.bar(), x.baz = 42, x(42), x[0] = 1
 * or x + y, including null-aware and cascade accesses which effectively desugar
 * to one of those direct accesses, and including implicit member accesses on
 * this, the language first checks whether the static type of x has a member
 * with the same base name as the operation. That is, if it has a corresponding
 * instance member, respectively, a foo method or getter or a foo= setter, a bar
 * member or bar= setter, a baz member or baz= setter, a call method, a
 * []= operator or a + operator. If so, then the operation is unaffected by
 * extensions. This check does not care whether the invocation is otherwise
 * correct, based on number or type of the arguments, it only checks whether
 * there is a member at all.
 *
 * @description Check that an instance member takes a precedence over an
 * extension member and it's never mind if the invocation is otherwise correct,
 * based on number or type of the arguments, it only checks whether there is a
 * member at all.
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

class A {}

class C extends A {
  String method(int i) => "$i";
}

extension E<T extends A> on T {
  String method(int i, String s) {}
}

main() {
  C c = new C();
  c.method(42, "-42");
}
