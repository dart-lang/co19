/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that the parameterized type G<T1..Tk> is regular-bounded
 * when Tj <: [T1/X1 .. Tk/Xk]Bj for all j, 1 <= j <= k, where X1..Xk are the
 * formal type parameters of G in declaration order, and B1..Bk are the
 * corresponding upper bounds.
 * This means that each actual type argument satisfies the declared upper bound
 * for the corresponding formal type parameter.
 * We extend covariance for generic class types such that it can be used also in
 * cases where a type argument violates the corresponding bound.
 * For instance, assuming the classes [C] and [D] as declared in the
 * [Motivation] section, [C<D>] is a subtype of [C<Object>]. This is new because
 * [C<Object>] used to be a compile-time error, which means that no questions
 * could be asked about its properties. Note that this is a straightforward
 * application of the usual covariance rule: [C<D> <: C<Object>] because
 * [D <: Object]. We need this relaxation of the rules in order to be able to
 * define which violations of the declared bounds are admissible.
 * @description Checks that assigning [void] as a bound of super-bounded type
 * does not cause compile error.
 * @author iarkh@unipro.ru
 * @issue #32903
 */

class C<X extends C<X>> {}
class D extends C<D> {}

main() {
  D d = new D();
  C<void> c = d;
}
