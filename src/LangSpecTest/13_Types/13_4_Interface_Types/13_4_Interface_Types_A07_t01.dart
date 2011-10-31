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
 * Dynamic type argument is produced by failing to supply any type arguments for a generic type that uses them (see 13.6).
 * @author iefremov
 * @reviewer rodionov
 */

class CheckDynamic<D> {
  CheckDynamic() {
  }
  
  void check() {
    Expect.isTrue(new Object() is D);
    Expect.isTrue(1 is D);
    Expect.isTrue(0.0 is D);
    Expect.isTrue("" is D);
    Expect.isTrue(true is D);
    Expect.isTrue(false is D);
    Expect.isTrue(new List() is D);
    Expect.isTrue(new List<Map<List, List<int>>>() is D);
    Expect.isTrue(f() {} is D);
    Expect.isTrue(void f() {} is D);
    Expect.isTrue(List<Map<List, Map>> f(num n, Object o, [var x, List y]) {} is D);
  }
}

main() {
  new CheckDynamic().check();
}

