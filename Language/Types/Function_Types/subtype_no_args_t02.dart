// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A function type (T1,...Tk,[Tk+1,...,Tn+m]) -> T is a subtype of
/// the function type (S1,...,Sk+j,[Sk+j+1,...,Sn]) -> S, if all of the following
/// conditions are met:
/// 1. Either
///    • S is void, or
///    • T <=> S.
/// 2. ∀i ∈ 1..n, Ti ⇐⇒ Si.
/// @description Checks that this statement is true for function types with no
/// arguments: S is some type, T is Dynamic (assignable to S).
/// @author iefremov
/// @issue 42648

import "../../../Utils/expect.dart";

typedef t1();
typedef void t2();
typedef int t3();
typedef String t4();
typedef double t5();
typedef Object t6();
typedef t1 t7();
typedef List t8();
typedef List<int> t9();
typedef Map<int, List<List<List>>> t10();
typedef t10 t11();
typedef t11 t12();


main() {
  Expect.isTrue(() {} is t1);
  Expect.isTrue(() {} is t2);
  Expect.isFalse(() {} is t3);
  Expect.isFalse(() {} is t4);
  Expect.isFalse(() {} is t5);
  Expect.isFalse(() {} is t6);
  Expect.isFalse(() {} is t7);
  Expect.isFalse(() {} is t8);
  Expect.isFalse(() {} is t9);
  Expect.isFalse(() {} is t10);
  Expect.isFalse(() {} is t11);
  Expect.isFalse(() {} is t12);
}
