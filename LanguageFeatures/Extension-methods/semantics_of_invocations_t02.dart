/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If an extension is found to be the one applying to a member
 * invocation, then at run-time, the invocation will perform a method invocation
 * of the corresponding instance member of the extension, with [this] bound to
 * the receiver value and type parameters bound to the types found by static
 * inference.
 * @description Check that [this] bounds to the receiver value if receiver has
 * type parameters
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

import "../../Utils/expect.dart";

class A<T1, T2, T3> {}

extension ExtendedA<T1, T2, T3> on A<T1, T2, T3> {
  A checkme() => this;
  A get checkGetter => this;
  void test(A expected) {
    Expect.equals(expected, this);
  }
}

main() {
  A a = A();
  Expect.equals(a, a.checkme());
  Expect.equals(a, a.checkGetter);
  a.test(a);

  A<int, num, String> a = A<int, num, String>();
  Expect.equals(a, a.checkme());
  Expect.equals(a, a.checkGetter);
  a.test(a);
}
