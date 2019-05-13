/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A generic type alias is a declaration [D] of one of the following
 * forms:
 *   m typedef id<X1 extends B1, . . . , Xs extends Bs> = T;
 *   ...
 * Under the assumption that X1, . . . , Xs are types such that Xj <: Bj, for
 * all j ∈ 1..s, it is a compile-time error if [T] is not regular-bounded, and
 * it is a compile-time error if any type occurring in [T] is not well-bounded.
 * @description Checks that there is no compile time error if [T] is well
 * bounded.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

class A {}
class B<X> {}
class C<X extends C<X>> {}

typedef Alias<X> = Function<Y extends X> (X x);

typedef AAlias<X extends A> = Function<Y extends X> ();

typedef BAlias1<X extends B> = Function<Y extends X> (X x);
typedef BAlias2<X extends B<num>> = X Function<Y extends X> ();

typedef CAlias1<X extends C<X>> = X Function(X x);
typedef CAlias2<X extends C<C<dynamic>>> = X Function(X x);

main() {}