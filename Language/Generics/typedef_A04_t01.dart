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
 * some class
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
import "../../Utils/expect.dart";

class X {}
class Y extends X {}

class A<T> {
  test(expected) {
    Expect.equals(expected, T);
  }
}

typedef AAlias<T> = A<T>;
typedef BAlias<T extends X> = A<T>;

main() {
 AAlias().test(dynamic);
 AAlias<int>().test(int);
 AAlias<X>().test(X);
 AAlias<Y>().test(Y);

 BAlias().test(X);
 BAlias<Y>().test(Y);
}
