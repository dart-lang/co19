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
 * @description Check that if generic legacy class implements generic opted-in
 * class, legacy type parameter is OK and the fact that parent class type
 * parameter is non-nullable is ignored.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// @dart=2.6

import "../../../Utils/expect.dart";
import "override_checking_A01_opted_in_lib.dart";

class A1<T extends int>      implements OPTED_NONNULLABLE_INT     <T> { dynamic getParamType() => typeOf<T>(); }
class A2<T extends Object>   implements OPTED_NONNULLABLE_OBJECT  <T> { dynamic getParamType() => typeOf<T>(); }
class A3<T extends Function> implements OPTED_NONNULLABLE_FUNCTION<T> { dynamic getParamType() => typeOf<T>(); }

main() {
  Expect.equals(int, A1().getParamType());
  Expect.equals(int, A1<int>().getParamType());

  Expect.equals(Object, A2().getParamType());
  Expect.equals(Object, A2<Object>().getParamType());

  Expect.equals(Function, A3().getParamType());
  Expect.equals(Function, A3<Function>().getParamType());
}
