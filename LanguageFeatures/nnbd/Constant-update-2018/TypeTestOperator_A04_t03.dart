/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression of the form 'e as T' is potentially constant if e is
 * a potentially constant expression and T is a potentially constant type
 * expression, and it is further constant if e is constant
 * @description Checks that an expression of the form [e is! T] is accepted
 * if [T] is a potential constant type.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

import "../../../Utils/expect.dart";

class MyClass<E> {
  final int res;
  const MyClass(Object o) : res = o is! E ? 0 : 1;
}

main() {
  const MyClass cl = MyClass<int>("testme");
  Expect.equals(0, cl.res);

  const MyClass cl1 = MyClass<int>(99);
  Expect.equals(1, cl1.res);
}
