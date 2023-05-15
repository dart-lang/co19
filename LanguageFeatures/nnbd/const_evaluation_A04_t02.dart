// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion CONST_CANONICAL_TYPE(FutureOr<T>) = FutureOr<S>* where S is
/// CONST_CANONICAL_TYPE(T)
///
/// @description Checks that
/// CONST_CANONICAL_TYPE(FutureOr<int?>) = FutureOr<int?>
///
/// @author iarkh@unipro.ru

// Requirements=nnbd-strong

import"dart:async";
import "../../Utils/expect.dart";
import "const_evaluation_lib.dart";

dynamic d = null;
Never n = throw "Should not reach here";

const c1 = C<FutureOr<int?>>(null);
void test1() => c1.test(1);
void test2() => c1.test(null);
void test3() => c1.test(d);
void test4() => c1.test(n);

main() {
  test1();
  test2();
  test3();
  Expect.throws(() => test4());
}
