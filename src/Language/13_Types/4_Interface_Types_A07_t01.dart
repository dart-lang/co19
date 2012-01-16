/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is more specific than a type S, written T << S, if S is Dynamic.
 * << is a partial order on types. T is a subtype of S, written T <: S, iff [⊥/Dynamic]T << S.
 * A type T may be assigned to a type S, written T <=> S, if either T <: S or S <: T.
 * @description Checks that any type (interface type, function type, generic) is (more specific than) Dynamic.
 * @author iefremov
 * @reviewer rodionov
 */

main() {
  Expect.isTrue(new Object() is Dynamic);
  Expect.isTrue(1 is Dynamic);
  Expect.isTrue(0.0 is Dynamic);
  Expect.isTrue("" is Dynamic);
  Expect.isTrue(true is Dynamic);
  Expect.isTrue(false is Dynamic);
  Expect.isTrue(new List() is Dynamic);
  Expect.isTrue(new List<Map<List, List<int>>>() is Dynamic);
  Expect.isTrue(f() {} is Dynamic);
  Expect.isTrue(void f() {} is Dynamic);
  Expect.isTrue(List<Map<List, Map>> f(num n, Object o, [var x, List y]) {} is Dynamic);
}

