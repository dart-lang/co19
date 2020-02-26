/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A generic class declaration introduces a generic class into the 
 * enclosing library scope. A generic class is a mapping that accepts a list of
 * actual type arguments and maps them to a class. Consider a generic class
 * declaration [G] named [C] with formal type parameter declarations [X1 extends
 * B1,..., Xm extends Bm], and a parameterized type [T] of the form
 * [C<T1,..., Tl>].
 * Otherwise, said parameterized type [C<T1,..., Tm>] denotes an application of
 * the generic class declared by [G] to the type arguments [T1],...,[Tm]. This
 * yields a class [C0] whose members are equivalent to those of a class
 * declaration which is obtained from the declaration [G] by replacing each
 * occurrence of [Xj] by [Tj].
 * @description Checks that each occurrence of [Xj] is replaced by [Tj] for
 * generic class [C0] with several parameters.
 * @author iarkh@unipro.ru
 */
import "dart:async";
import "../../Utils/expect.dart";

class A<X extends A<X>> {}

class C<T1, T2, T3> {
  check(exp1, exp2, exp3) {
    Expect.equals(exp1, T1);
    Expect.equals(exp2, T2);
    Expect.equals(exp3, T3);
  }
}

main() {
  (new C<int, int, int>()).check(int, int, int);
  (new C<List, dynamic, String>()).check(List, dynamic, String);
  (new C<String, Null, Null>()).check(String, Null, Null);
  (new C<C, C, C>()).check(C, C, C);
  (new C<A, C, C>()).check(A, C, C);
  (new C<dynamic, dynamic, dynamic>()).check(dynamic, dynamic, dynamic);
  (new C<Null, Null, Null>()).check(Null, Null, Null);
  (new C<Object, List, FutureOr>()).check(Object, List, Object);
  (new C<FutureOr, dynamic, dynamic>()).check(Object, dynamic, dynamic);
}

