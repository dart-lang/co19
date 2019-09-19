/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion For generic extensions, standard type inference is used to infer
 * the type arguments
 *
 * @description Check that for generic extensions, standard type inference is
 * used to infer the type arguments
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods
import "../../Utils/expect.dart";

class A {}
class C extends A {}

extension Ext<T extends A> on List<T> {
  Type method() => T;
}

main() {
  List<C> list1 = [];
  Expect.isTrue(list1.method() == C);

  List<A> list2 = [];
  Expect.isTrue(list2.method() == A);
}
