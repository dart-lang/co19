// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion CONST_CANONICAL_TYPE(T) = T if T is dynamic, void, Null
///
/// @description Checks that CONST_CANONICAL_TYPE(void) = void
/// @author iarkh@unipro.ru

import "const_evaluation_lib.dart";

dynamic d = null;
const c1 = C<void>(null);
void test1() => c1.test(1);
void test2() => c1.test(null);
void test3() => c1.test(int);
void test4() => c1.test(d);

main() {
  test1();
  test2();
  test3();
  test4();
}
