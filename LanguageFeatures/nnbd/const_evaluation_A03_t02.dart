// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion CONST_CANONICAL_TYPE(T) = T* if T is Never or Object
///
/// @description Checks that `CONST_CANONICAL_TYPE(Never) = Never*`
///
/// @author iarkh@unipro.ru

// Requirements=nnbd-strong

import "../../Utils/expect.dart";
import "const_evaluation_lib.dart";

Never n = throw "Should not reach here";
const c1 = C1<Never>();

void test1() => c1.test(null);
void test2() => c1.test(1);
void test3() => c1.test(int);
void test4() => c1.test(n);

main() {
  Expect.throws(() => test1());
  Expect.throws(() => test2());
  Expect.throws(() => test3());
  Expect.throws(() => test4());
}
