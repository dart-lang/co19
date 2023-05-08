// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion CONST_CANONICAL_TYPE(C<T0, ..., Tn>) = C<R0, ..., Rn>*
///  where Ri is CONST_CANONICAL_TYPE(Ti)
///  Note this includes the case of an interface type with no generic parameters
///  (e.g int).
///
/// @description Checks that
/// `CONST_CANONICAL_TYPE(C<T0, ..., Tn>) = C<R0, ..., Rn>*`
///
/// @author iarkh@unipro.ru

// Requirements=nnbd-strong

import "../../Utils/expect.dart";
import "const_evaluation_lib.dart";

dynamic d = null;
Never n = throw "Should not reach here";

const c1 = C1<List<int>?>();

void test1() => c1.test(<int>[]);
void test2() => c1.test([1, 2, 3]);
void test3() => c1.test("It's wrong!");
void test4() => c1.test(d);
void test5() => c1.test(n);

main() {
  test1();
  test2();
  Expect.throws(() => test3());
  test4();
  Expect.throws(() => test5());
}
