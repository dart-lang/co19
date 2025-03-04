// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion CONST_CANONICAL_TYPE(X extends T) = X*
///
/// @description Checks that `CONST_CANONICAL_TYPE(X extends T) = X*`
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";
import "const_evaluation_lib.dart";

dynamic d = null;
Never n = throw "Should not reach here";

class D1<T> extends C1<T> {
  const D1() : super();
}

const d1 = D1<int?>();

void test1() => d1.test(1);
void test2() => d1.test(null);
void test3() => d1.test("It's wrong!");
void test4() => d1.test(d);
void test5() => d1.test(n);

main() {
  test1();
  test2();
  Expect.throws(() => test3());
  test4();
  Expect.throws(() => test5());
}
