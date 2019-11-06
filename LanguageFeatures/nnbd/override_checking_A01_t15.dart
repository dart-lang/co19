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
 * @description Check that if legacy class extends opted-in class, all
 * nullability annotations in the parent class are ignored in the child class
 * type parameters and class type parameter can be [Null].
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// @dart=2.4

import "../../Utils/expect.dart";
import "override_checking_opted_in_lib.dart";

class D1<X extends A> extends D<X> {}
class E1<X extends A> extends E<X> {}

main() {
  D<Null> d = D<Null>();
  Expect.equals(Null, d.getParamType());

  E<Null> e = E<Null>();
  Expect.equals(Null, e.getParamType());

  D1<Null> d1 = D1<Null>();
  Expect.equals(Null, d1.getParamType());

  E1<Null> e1 = E1<Null>();
  Expect.equals(Null, e1.getParamType());
}
