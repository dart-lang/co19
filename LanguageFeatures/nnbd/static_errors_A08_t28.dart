/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if a potentially non-nullable local variable which
 * has no initializer expression and is not marked late is used before it is
 * definitely assigned
 *
 * @description Check that it is not an error if a potentially non-nullable
 * local variable which has no initializer expression but is marked late is used
 * before it is definitely assigned. Test FutureOr<T>, where <T extends Object>
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";
import "dart:async";

class C<T extends Object> {
  void test2() {
    late FutureOr<T> t;
    Expect.throws(() {t.toString();}, (e) => e is LateInitializationError);
  }
}

void test<T extends Object>() {
  late FutureOr<T> t;
  Expect.throws(() {t.toString();}, (e) => e is LateInitializationError);
}
main() {
  new C().test2();
  test();
}
