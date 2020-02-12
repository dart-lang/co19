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
 * @description Check that if legacy generic class extends legacy class and
 * implements opted-in class, child class type parameter can be [Null] if parent
 * interface type parameter is nullable.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// @dart=2.6

import "../../../Utils/expect.dart";
import "override_checking_A01_opted_in_lib.dart";

class B1<T> { dynamic getParamType() => typeOf<T>(); }
class B2<T> { dynamic getParamType() => typeOf<T>(); }
class B3<T> { dynamic getParamType() => typeOf<T>(); }
class B4<T> { dynamic getParamType() => typeOf<T>(); }
class B5<T> { dynamic getParamType() => typeOf<T>(); }
class B6<T> { dynamic getParamType() => typeOf<T>(); }

class A1<T extends Null> extends B1<T> implements OPTED_NULLABLE         <T> {}
class A2<T extends Null> extends B2<T> implements OPTED_DYNAMIC          <T> {}
class A3<T extends Null> extends B3<T> implements OPTED_NULLABLE_INT     <T> {}
class A4<T extends Null> extends B4<T> implements OPTED_NULLABLE_OBJECT  <T> {}
class A5<T extends Null> extends B5<T> implements OPTED_NULLABLE_FUNCTION<T> {}
class A6<T extends Null> extends B6<T> implements OPTED_NULL             <T> {}

main() {
  Expect.equals(Null, A1().getParamType());
  Expect.equals(Null, A1<Null>().getParamType());

  Expect.equals(Null, A2().getParamType());
  Expect.equals(Null, A2<Null>().getParamType());

  Expect.equals(Null, A3().getParamType());
  Expect.equals(Null, A3<Null>().getParamType());

  Expect.equals(Null, A4().getParamType());
  Expect.equals(Null, A4<Null>().getParamType());

  Expect.equals(Null, A5().getParamType());
  Expect.equals(Null, A5<Null>().getParamType());

  Expect.equals(Null, A6().getParamType());
  Expect.equals(Null, A6<Null>().getParamType());
}
