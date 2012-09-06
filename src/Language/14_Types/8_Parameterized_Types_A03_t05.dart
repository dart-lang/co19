/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If S is the static type of a member m of G, then the static type of the member m of 
 * G<A1, ..., An> is [A1, ..., An / T1, ..., Tn]S where T1, ..., Tn are the formal type parameters of G.
 * Let Bi be the bounds of Ti, 1 <= i <= n. It is a static type warning if Ai is not a subtype of
 * [A1, ... , An / T1, ... , Tn]Bi , 1 <= j <= kn.
 * @description Several type arguments, the first one violates the bound.
 * @author rodionov
 * @reviewer iefremov
 * @static-warning
 * @needsreview issue 3273
 */

class F1 {}

class F2 extends F1 {}

class F3 extends F2 {}

class A<F extends F2, T extends String, S extends Object> {}

main() {
  A<F1, String, List> a;
}
