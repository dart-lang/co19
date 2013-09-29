/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let T be a parameterized type G <S1,...,Sn >. If G is not a generic
 * type, the type arguments Si, 1 <= i <= n are discarded. If G has m != n type
 * parameters, T is treated as as a parameterized type with m arguments, all of
 * which are dynamic.
 * Otherwise, let Ti be the type parameters of G and let Bi be the bound of
 * Ti, i in 1..n,.
 * T is malbounded iff either Si is malbounded or Si is not a subtype of
 * [S1,...,Sn/T1,...,Tn]Bi, i in 1..n.
 * Note, that, in checked mode, it is a dynamic type error if a malbounded type
 * is used in a type test as specified in (Types/Dynamic Type System).
 * Any use of a malbounded type gives rise to a static warning.
 * @description Checks that it if there is a mismatch in arguments number to a
 * generic type in generic type invocation, type arguments are treated as dynamic.
 * @static-warning
 * @author ilya
 */
import "../../Utils/expect.dart";

class C<T1, T2> {
  test() {
    Expect.isTrue(1 is T1);
    Expect.isTrue(1 is T2);
    Expect.isTrue('foo' is T1);
    Expect.isTrue('foo' is T2);
  }
}

main() {
  new C<List>().test();
  new C<List,List,List>().test();
}