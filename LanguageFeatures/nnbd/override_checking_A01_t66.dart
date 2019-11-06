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
 * @description Check that if legacy class implements two classes with some
 * getter (one or both classes are opted-in), all nullability annotations in the
 * parent class are ignored in the child class type parameters and legacy class
 * type parameter can be [Null].
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// @dart=2.4

import "../../Utils/expect.dart";
import "override_checking_opted_in_lib.dart";

abstract class F<X extends A> {
  dynamic getParamType();
}

class DE<X extends A> implements D<X>, E<X> {
  dynamic getParamType() => X;
}

class DF<X extends A> implements D<X>, F<X> {
  dynamic getParamType() => X;
}

class EF<X extends A> implements D<X>, F<X> {
  dynamic getParamType() => X;
}

main() {
  DE<Null> de = DE<Null>();
  Expect.equals(Null, de.getParamType());

  DF<Null> df = DF<Null>();
  Expect.equals(Null, df.getParamType());

  EF<Null> ef = EF<Null>();
  Expect.equals(Null, ef.getParamType());
}
