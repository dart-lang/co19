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
 * inference if extended class has several type parameters.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

import "../../Utils/expect.dart";

class A<T1, T2, T3> {}

extension<T, T1, T2, T3> ExtendedA on T<T1, T2, T3> {
  void test(dynamic expected, expected1, expected2, expected3) {
    Expect.equals(expected, T);
    Expect.equals(expected1, T1);
    Expect.equals(expected2, T2);
    Expect.equals(expected3, T3);
  }
}

main() {
  A a = A<int, String, num>();
  a.test(A, int, String, num);
}
