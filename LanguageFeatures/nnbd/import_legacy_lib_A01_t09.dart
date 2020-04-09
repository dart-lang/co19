/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The type system is extended with a notion of a legacy type
 * operator. For every type T, there is an additional type T* which is the
 * legacy version of the type. There is no surface syntax for legacy types, and
 * implementations should display the legacy type T* in the same way that they
 * would display the type T, except in so far as it is useful to communicate to
 * programmers for the purposes of error messages that the type originates in
 * unmigrated code.
 *
 * @description Check that all fields of legacy type T* are nullable.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "legacy_lib.dart";

class MyMx {
  String sMx = "Let it be";
}

class B extends A with MyMx {
}

main() {
  B b = new B();
  C<B> c = new C(b);
  c.x.text = null;
  c.x.sMx = null;
//          ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
