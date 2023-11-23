// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion CONST_CANONICAL_TYPE(T) = T if T is dynamic, void, Null
///
/// @description Checks that CONST_CANONICAL_TYPE(Null) = Null
///
/// @author iarkh@unipro.ru

// Requirements=nnbd-strong

import "../../Utils/expect.dart";
import "const_evaluation_lib.dart";

dynamic d1 = null;
dynamic d2 = 2;

const c1 = C<Null>(null);
void test1() => c1.test(null);
void test2() => c1.test(1);
void test3() => c1.test(int);
void test4() => c1.test(d1);
void test5() => c1.test(d2);

main() {
  test1();
  Expect.throws(() => test2());
  Expect.throws(() => test3());
  test4();
  Expect.throws(() => test5());
}
