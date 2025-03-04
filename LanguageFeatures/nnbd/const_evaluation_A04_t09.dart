// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion CONST_CANONICAL_TYPE(FutureOr<T>) = FutureOr<S>* where S is
/// CONST_CANONICAL_TYPE(T)
///
/// @description Checks that
/// `CONST_CANONICAL_TYPE(FutureOr<Never>) = FutureOr<Never>*`
/// @author iarkh@unipro.ru

import"dart:async";
import "../../Utils/expect.dart";
import "const_evaluation_lib.dart";

dynamic d = null;
Never n = throw "Should not reach here";

const c = C1<FutureOr<Never>>();

void test1() => c.test(1);
void test2() => c.test(null);
void test3() => c.test(d);
void test4() => c.test(n);

main() {
  Expect.throws(() => test1());
  Expect.throws(() => test2());
  Expect.throws(() => test3());
  Expect.throws(() => test4());
}
