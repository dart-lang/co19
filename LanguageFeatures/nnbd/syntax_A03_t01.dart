/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The grammar of expressions is extended to allow any expression to
 * be suffixed with a !.
 *
 * @description Check that any expression can be suffixed with a !
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

class C {}

test1(C c) {}

test2(Object o) {}

main() {
  C? c = new C();
  test1(c!);

  Object? o = new Object();
  test2(o!);

  int? i = 42;
  test2(i!);

  Expect.throws(() {null!;});
}
