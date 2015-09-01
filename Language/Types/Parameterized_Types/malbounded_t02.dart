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
 * @description Checks that it is a static warning if last type argument violates the bound.
 * @static-warning
 * @author iefremov
 * @reviewer rodionov
 */

class A<T extends String, S extends Object, U extends int> {}

main() {
  A<String, List, double> a; /// static type warning 
}
