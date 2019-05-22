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
 * some function
 * @author iarkh@unipro.ru
 */
import "../../Utils/expect.dart";

class X {}
class Y extends X {}

void checkme1<T>() {}
void checkme2<T extends X>() {}
void checkme3<T extends Y>() {}

typedef Func1<T> = void Function<T1 extends T>();
typedef Func2<T extends X> = void Function<T1 extends T>();
typedef Func3<T extends Y> = void Function<T1 extends T>();

main() {
  Expect.isTrue(checkme1 is Func1);
  Expect.isFalse(checkme1 is Func2);
  Expect.isFalse(checkme1 is Func3);

  Expect.isFalse(checkme2 is Func1);
  Expect.isTrue(checkme2 is Func2);
  Expect.isFalse(checkme2 is Func3);

  Expect.isFalse(checkme3 is Func1);
  Expect.isFalse(checkme3 is Func2);
  Expect.isTrue(checkme3 is Func3);
}
