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
 * @description Check that when choosing the most specific class field
 * during interface computation, all nullability annotations are ignored in
 * unmigrated library and are not ignored in migrated library ([extends] clause).
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// @dart=2.4

import "../../Utils/expect.dart";
import "override_checking_opted_in_lib.dart";

class A1 extends A {
  String field1 = "c";
  String field2 = "d";
}

class A2 extends A {
  String field1 = null;
  String field2 = null;
}

main() {
  A a = A();
  a.field1 = null;
  Expect.isNull(a.field1);
  a.field2 = null;
  Expect.isNull(a.field2);

  A1 a1 = A1();
  a1.field1 = null;
  Expect.isNull(a1.field1);
  a1.field2 = null;
  Expect.isNull(a1.field2);

  A2 a2 = A2();
  Expect.isNull(a2.field1);
  Expect.isNull(a2.field2);

  C c = C();
  c.field1 = null;
  Expect.isNull(c.field1);
  c.field2 = null;
  Expect.isNull(c.field2);
}
