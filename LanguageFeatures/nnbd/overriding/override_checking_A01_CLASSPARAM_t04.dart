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
 * @description Check that if generic legacy class extends generic opted-in
 * class with [FutureOr] class type parameter, legacy type parameter is OK and
 * can be [Null] even if parent class type parameter is non-nullable.
 *
 * @Issue 39666.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// @dart=2.6

import "dart:async";
import "../../../Utils/expect.dart";
import "override_checking_A01_opted_in_futureor_lib.dart";

class A<T extends Null> extends OPTED_FUTUREOR_INT<T> { dynamic getParamType() => typeOf<T>(); }

main() {
  Expect.equals( Null, A()      .getParamType());
  Expect.equals( Null, A<Null>().getParamType());
}
