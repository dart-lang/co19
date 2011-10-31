/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If S is the static type of a member m of G, then the static type of the member m of G<A1, ..., An> is
 * [A1, ..., An / T1, ..., Tn]S where T1, ..., Tn are the formal type parameters of G.
 * Let Bi1, ..., Biki, be the bounds of Ti, 1 <= i <= n. It is a static type warning if Ai is not a subtype of
 * [A1, ... , An / T1, ... , Tn]Bij , 1 <= j <= ki.
 * @description Many type arguments, last of them breaks the bound.
 * @author iefremov
 * @static-type-error
 */

class A<T extends String, S extends Object, U extends int> {}

main() {
  A<String, Array, double> a;
}
