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
 * [D] introduces a mapping from actual type argument lists to types.
 * @description Checks that [D] maps argument list to types when [T] represents
 * some class with several parameters
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
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

main() {
  AAlias().test(dynamic, dynamic, dynamic);
  AAlias<int, String, num>().test(int, String, num);

  BAlias().test(dynamic, dynamic, dynamic);
  BAlias<int, String, num>().test(int, String, num);
}
