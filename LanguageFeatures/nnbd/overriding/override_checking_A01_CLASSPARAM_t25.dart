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
 * @description Check that if generic legacy class is a mixin with generic
 * opted-in class, legacy type parameter is OK if parent class type parameter is
 * nullable.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// @dart=2.6

import "../../../Utils/expect.dart";
import "override_checking_A01_opted_in_lib.dart";

class A1<T>                  with OPTED_NULLABLE<T>          { dynamic getParamType() => typeOf<T>(); }
class A2<T extends dynamic>  with OPTED_DYNAMIC<T>           { dynamic getParamType() => typeOf<T>(); }
class A3<T extends int>      with OPTED_NULLABLE_INT<T>      { dynamic getParamType() => typeOf<T>(); }
class A4<T extends Object>   with OPTED_NULLABLE_OBJECT<T>   { dynamic getParamType() => typeOf<T>(); }
class A5<T extends Function> with OPTED_NULLABLE_FUNCTION<T> { dynamic getParamType() => typeOf<T>(); }

main() {
  Expect.equals(dynamic, A1().getParamType());
  Expect.equals(dynamic, A1<dynamic>().getParamType());

  Expect.equals(dynamic, A2().getParamType());
  Expect.equals(dynamic, A2<dynamic>().getParamType());

  Expect.equals(int, A3().getParamType());
  Expect.equals(int, A3<int>().getParamType());

  Expect.equals(Object, A4().getParamType());
  Expect.equals(Object, A4<Object>().getParamType());

  Expect.equals(Function, A5().getParamType());
  Expect.equals(Function, A5<Function>().getParamType());
}
