/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error to read a field or tear off a method from an
 * expression whose type is potentially nullable and not dynamic, except for the
 * methods and fields on Object.
 *
 * @description  Check that it is no compile-time error to read a field or tear
 * off a method from an expression whose type is potentially nullable if
 * they are  methods on Object. Test that methods of Object are allowed for the
 * type <T extends Object?>
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

class C<T extends Object?> {
  T a;
  C(this.a);

  test() {
    Expect.isNotNull(a.toString);
  }
}

main() {
  C<Object?> c = new C<Object?>(new Object());
  c.test();
}
