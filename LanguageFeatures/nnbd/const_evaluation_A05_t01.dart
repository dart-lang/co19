// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion CONST_CANONICAL_TYPE(T?) =
///     let S be CONST_CANONICAL_TYPE(T)
///     if S is R* then R?
///     else S?
///
/// @description Checks that CONST_CANONICAL_TYPE(int?) = int?
///
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";
import "const_evaluation_lib.dart";

dynamic d = null;
Never n = throw "Should not reach here";

const c1 = C<int?>(null);
const c2 = C<int?>(11);

void test1() => c1.test(1);
void test2() => c1.test(null);
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
