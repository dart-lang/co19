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
 * @description Check that type parameters bounds to the types found by static
 * inference.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

import "../../Utils/expect.dart";

class A {}

extension ExtendedA<T> on T {
  dynamic checkme() => T;
  dynamic get checkGetter => T;
  void test(dynamic expected) {
    Expect.equals(expected, T);
  }
}

main() {
  A a = A();
  Expect.equals(A, a.checkme());
  Expect.equals(A, a.checkGetter);
  a.test(A);
}
