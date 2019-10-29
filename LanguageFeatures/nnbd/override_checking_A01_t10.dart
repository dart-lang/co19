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
 *
 * @description Check that when choosing the most specific class field
 * during interface computation, all nullability annotations are ignored in
 * unmigrated library for setters which set non-null value ([extends] clause).
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// @dart=2.4

import "../../Utils/expect.dart";
import "override_checking_opted_in_lib.dart";

class A1 extends A {
  void set set_field1(String str) { field1 = "c"; }
  void set set_field2(String str) { field2 = "d"; }
}

main() {
  A a = A();
  a.set_field1 = "set_a";
  Expect.equals("set_a", a.get_field1);
  a.set_field2 = "set_a2";
  Expect.equals("set_a2", a.get_field2);

  A1 a1 = A1();
  a1.set_field1 = "1";
  Expect.equals("c", a1.get_field1);
  a1.set_field2 = "2";
  Expect.equals("d", a1.get_field2);

  C c = C();
  c.set_field1 = "1";
  Expect.equals("1", c.get_field1);
  c.set_field2 = "2";
  Expect.equals("2", c.get_field2);
}
