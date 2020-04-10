/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let [G] be a generic class or parameterized type alias with formal
 * type parameter declarations [F1] .. [Fk] containing formal type parameters
 * [X1] .. [Xk] and bounds [B1] .. [Bk]. We say that the formal type parameter
 * [Xj] has a simple bound when one of the following requirements is satisfied:
 * [Bj] is omitted.
 * [Bj] is included, but does not contain any of [X1] .. [Xk]. If [Bj] contains
 * a type [T] on the form qualified (for instance, [C] or [p.D]) which denotes a
 * generic class or parameterized type alias [G1] (that is, [T] is a raw type),
 * every type argument of [G1] has a simple bound.
 * @description Checks that instantiate-to-bounds works correctly for [typedef]
 * with two parameters
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
import "../../../Utils/expect.dart";

class A<X> {}
class B<X> {}
typedef G<X extends A<B>, Y extends B<A>> =
    void Function<X1 extends X, Y1 extends Y>(X);
typedef G_expected = void Function<X1 extends A<B>, Y1 extends B<A>>(A<B>);

main() {
  Expect.equals(G_expected, G);
}
