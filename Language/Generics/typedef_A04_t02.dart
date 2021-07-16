// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A generic type alias is a declaration [D] of one of the following
/// forms:
///   m typedef id<X1 extends B1, . . . , Xs extends Bs> = T;
///   ...
/// [D] introduces a mapping from actual type argument lists to types.
/// @description Checks that [D] maps argument list to types when [T] represents
/// some class with several parameters
/// @Issue 42432
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

class A<T1, T2, T3> {
  test(exp1, exp2, exp3) {
    Expect.equals(exp1, T1);
    Expect.equals(exp2, T2);
    Expect.equals(exp3, T3);
  }
}

typedef AAlias<T1, T2, T3> = A<T1, T2, T3>;
typedef BAlias = AAlias;
typedef CAlias = A<int, String, num>;
typedef DAlias<T> = A<T, T, T>;

main() {
  AAlias().test(dynamic, dynamic, dynamic);
  AAlias<int, String, num>().test(int, String, num);

  BAlias().test(dynamic, dynamic, dynamic);

  CAlias().test(int, String, num);

  DAlias().test(dynamic, dynamic, dynamic);
  DAlias<int>().test(int, int, int);
}
