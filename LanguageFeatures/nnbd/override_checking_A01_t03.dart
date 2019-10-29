/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In an unmigrated library, override checking is done using legacy
 * types. This means that an unmigrated library can bring together otherwise
 * incompatible methods. When choosing the most specific signature during
 * interface computation, all nullability and requiredness annotations are
 * ignored, and the [Never] type is treated as [Null].
 * @description Check that when choosing the most specific signature during
 * interface computation, all requiredness annotations are ignored in unmigrated
 * library if method argument is not [null] ([extends] clause).
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// @dart=2.4

import "../../Utils/expect.dart";
import "override_checking_opted_in_lib.dart";

class A1 extends A {
  int test_required({int i = 1}) => 4;
}

class B1 extends B {
  int test_required({int i = 1}) => 5;
}

class C1 extends C {
  int test_required({int i = 1}) => 6;
}

main() {
  Expect.equals(1, A().test_required(i: 1));
  Expect.equals(2, B().test_required(i: 1));
  Expect.equals(3, C().test_required(i: 1));

  Expect.equals(4, A1().test_required(i: 1));
  Expect.equals(5, B1().test_required(i: 1));
  Expect.equals(6, C1().test_required(i: 1));
}
