/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let [T] be a [qualified] term which denotes a generic class [G]
 * (so [T] is a raw type), let [F1 .. Fk] be the formal type parameter
 * declarations in the declaration of [G], with type parameters [X1 .. Xk] and
 * bounds [B1 .. Bk] with types [T1 .. Tk]. For [i] in [1 .. k], let [Si] denote
 * the result of performing instantiate to bound on the type in the bound, [Ti];
 * in the case where [Bi] is omitted, let [Si] be dynamic.
 * @description Checks that omitted argument type during the object creation
 * results to creating an object with [dynamic] type parameter.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";

class A<T> {}
class B<T1, T2> {}
class C<T1, T2, T3> {}
class D<T1, T2, T3, T4> {}
class E<T1, T2, T3, T4, T5> {}
class F<T1, T2, T3, T4, T5, T6> {}
class Z<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10> {}

main() {
   A a = new A();
   Expect.isTrue(a is A<dynamic>);

   B b = new B();
   Expect.isTrue(b is B<dynamic, dynamic>);

   C c = new C();
   Expect.isTrue(c is C);
   Expect.isTrue(c is C<dynamic, dynamic, dynamic>);

   D d = new D();
   Expect.isTrue(d is D<dynamic, dynamic, dynamic, dynamic>);

   E e = new E();
   Expect.isTrue(e is E<dynamic, dynamic, dynamic, dynamic, dynamic>);

   F f = new F();
   Expect.isTrue(f is F<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic>);

   Z z = new Z();
   Expect.isTrue(z is Z<dynamic, dynamic, dynamic, dynamic, dynamic, dynamic,
       dynamic, dynamic, dynamic, dynamic>);
}
