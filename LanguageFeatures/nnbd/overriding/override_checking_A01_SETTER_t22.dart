/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
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
 * @description Check that if legacy class extends legacy class and implements
 * opted-in class, legacy setter can accept [null] values if corresponding
 * parent setter is of nullable type.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// @dart=2.6

import "dart:async";
import "../../../Utils/expect.dart";
import "override_checking_A01_opted_in_lib.dart";

class A extends B implements OPTED_NULLABLE_SETTER {}

class B {
  void set setInt     (int i)      { Expect.isNull(i); }
  void set setObject  (Object o)   { Expect.isNull(o); }
  void set setFunction(Function f) { Expect.isNull(f); }
  void set setFutureOr(FutureOr i) { Expect.isNull(i); }
  void set setDynamic (dynamic d)  { Expect.isNull(d); }
  void set setNull    (Null n)     { Expect.isNull(n); }
}

main() {
  A a = A();

  a.setInt      = null;
  a.setObject   = null;
  a.setFutureOr = null;
  a.setFunction = null;
  a.setDynamic  = null;
  a.setNull     = null;
}
