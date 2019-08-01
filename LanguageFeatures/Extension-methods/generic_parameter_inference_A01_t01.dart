/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If both the extension and the method is generic, then inference
 * must infer the extension type parameters first, to figure out whether the
 * extension applies, and only then start inferring method type parameters. As
 * mentioned above, the inference is similar to other cases of chained inference.
 * @description Check inference infers the extension type first and then infers
 * method type parameter.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

import "../../Utils/expect.dart";

class A {}
class B extends A {}
class C extends B {}

extension SuperList<T> on List<T> {

  void checkme<R extends T>(expected1, expected2) {
    Expect.equals(expected1, T);
    Expect.equals(expected2, R);
  }

}

main() {
  List<String> list1 = [];
  List<A> list2 = [A()];

  list1.checkme(String, String);

  list2.checkme(A, A);
  list2.checkme<A>(A, A);
  list2.checkme<B>(A, B);
  list2.checkme<C>(A, C);
}

